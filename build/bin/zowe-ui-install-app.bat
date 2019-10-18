@echo off
REM This program and the accompanying materials are
REM made available under the terms of the Eclipse Public License v2.0 which accompanies
REM this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
REM 
REM SPDX-License-Identifier: EPL-2.0
REM 
REM Copyright Contributors to the Zowe Project.
setlocal
if [%1]==[] goto :fail
set app_path="%~dpf1"
CALL :makedir "%USERPROFILE%\.zowe\ui"
CALL :makedir "%USERPROFILE%\.zowe\log"
set ZLUX_INSTALL_LOG_DIR="%USERPROFILE%\.zowe\log"
cd %~dp0\..\lib\zowe\zlux\zlux-server-framework\node_modules
set NODE_PATH=%cd%
cd ..\..\zlux-app-server\bin
if "%ZLUX_CONFIG_FILE%" == "" (
  if not exist "%USERPROFILE%\.zowe\ui\server.json" CALL node "%~dp0\..\lib\zowe\zlux\zlux-app-server\lib\initInstance.js"
  echo Initialized configuration
  if exist "%USERPROFILE%\.zowe\ui\server.json" set ZLUX_CONFIG_FILE="%USERPROFILE%\.zowe\ui\server.json"
)
CALL install-app.bat %app_path%
endlocal

rem Create a directory if it does not exist yet
:makedir
if not exist %1 mkdir %1
goto :eof
