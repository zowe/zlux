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
if "%INSTANCE_DIR%" == "" (
   if not "%USER_DIR%" == "" (
     set INSTANCE_DIR="%USERPROFILE%\.zowe"
   ) else (
     set INSTANCE_DIR="%USER_DIR%"
   )
)

CALL :makedir "%INSTANCE_DIR%\app-fw"

if "%ZLUX_NODE_LOG_DIR%" == "" (
   set ZLUX_NODE_LOG_DIR="%INSTANCE_DIR%\log"
)

CALL :makedir "%ZLUX_NODE_LOG_DIR%"

cd %~dp0\..\lib\zowe\zlux\zlux-server-framework\node_modules
set NODE_PATH=%cd%
cd ..\..\zlux-app-server\bin
if "%ZLUX_CONFIG_FILE%" == "" (
  if not exist "%INSTANCE_DIR%\app-fw\server.json" CALL node "%~dp0\..\lib\zowe\zlux\zlux-app-server\lib\initInstance.js"
  echo Initialized configuration
  if exist "%INSTANCE_DIR%\app-fw\server.json" set ZLUX_CONFIG_FILE="%INSTANCE_DIR%\app-fw\server.json"
)
CALL install-app.bat %app_path%
endlocal

rem Create a directory if it does not exist yet
:makedir
if not exist %1 mkdir %1
goto :eof
