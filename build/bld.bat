@echo off
REM This program and the accompanying materials are
REM made available under the terms of the Eclipse Public License v2.0 which accompanies
REM this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
REM 
REM SPDX-License-Identifier: EPL-2.0
REM 
REM Copyright Contributors to the Zowe Project.

set NODE_PATH=.;.\node_modules
set MVD_DESKTOP_DIR=%SRC_DIR%\zlux-app-manager\virtual-desktop

REM absolute nonsense to work around windows utility path limitations.
REM rd and del have issues with long paths
if not exist %SRC_DIR%\temp_nonsense mkdir %SRC_DIR%\temp_nonsense
cd %SRC_DIR%\zlux-server-framework
CALL npm install
del /F /Q lib\*.ts
rd /S /Q %SRC_DIR%\zlux-server-framework\dco-signoffs
cd %SRC_DIR%\zlux-shared\src\logging
CALL npm install
CALL npm run build
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-shared\src\logging\node_modules /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-shared\src\logging\node_modules
cd %SRC_DIR%\zlux-shared\src\obfuscator
CALL npm install
CALL npm run build
del /F /Q *.ts
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-shared\src\obfuscator\node_modules /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-shared\src\obfuscator\node_modules
rd /S /Q %SRC_DIR%\zlux-app-manager\dco-signoffs
cd %SRC_DIR%\zlux-app-manager\bootstrap
CALL npm install
CALL npm run build
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager\bootstrap\node_modules /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager\bootstrap\node_modules
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager\bootstrap\src /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager\bootstrap\src
cd %SRC_DIR%\zlux-app-manager\virtual-desktop
CALL npm install 
CALL npm run build 
CALL npm run build:externals
CALL npm run i18n
robocopy node_modules\requirejs web require.js /NS /NC /NFL /NDL /NP /NJH /NJS
REM rd /S /Q src
REM del /F /Q ts*
REM /F /Q webpack.config.js webpack.externals.js
del /F /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\xliffmerge.json
cd %SRC_DIR%\zlux-app-manager\virtual-desktop\nodeServer 
CALL npm install 
CALL npm run build 
cd %SRC_DIR%\zlux-app-manager\system-apps\app-prop-viewer\webClient
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager\virtual-desktop\nodeServer /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager\virtual-desktop\nodeServer
CALL npm install 
CALL npm run build
CALL npm run i18n
cd %SRC_DIR%\zlux-app-manager\system-apps\system-settings-preferences\webClient
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager\system-apps\app-prop-viewer\webClient /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager\system-apps\app-prop-viewer\webClient
CALL npm install 
CALL npm run build
CALL npm run i18n
cd %SRC_DIR%\zlux-app-manager\system-apps\admin-notification-app\webClient
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager\system-apps\system-settings-preferences\webClient /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager\system-apps\system-settings-preferences\webClient
CALL npm install
CALL npm run build
cd %SRC_DIR%
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager\system-apps\admin-notification-app\webClient /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager\system-apps\admin-notification-app\webClient
rd /S /Q %SRC_DIR%\zlux-shared\dco-signoffs
rd /S /Q %SRC_DIR%\zlux-shared\test
rd /S /Q  %SRC_DIR%\dco-signoffs
rd /S /Q %SRC_DIR%\zlux-build\dco-signoffs
del /F /S /Q "%SRC_DIR%\zlux-shared\src\logging\*.ts"
del /F /S /Q "sonar-project.properties"
del /F /S /Q *.ppf
del /F /S /Q .gitignore .gitattributes .gitmodules
del /F /S /Q .npm*
del /F /S /Q Jenkinsfile
del /F /S /Q settings.gradle
if not exist %PREFIX%\lib\zowe\zlux mkdir %PREFIX%\lib\zowe\zlux
CALL :deletejunk %SRC_DIR%\zlux-app-manager\bootstrap
CALL :deletejunk %SRC_DIR%\zlux-app-manager\system-apps
del /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\package.json
del /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\package-lock.json
del /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\tsconfig.json
del /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\tsconfig.ngx-i18n.json
del /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\tslint.json
del /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\webpack.config.js
del /Q %SRC_DIR%\zlux-app-manager\virtual-desktop\webpack.externals.js
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager\virtual-desktop\node_modules\.cache /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager\virtual-desktop\node_modules\.cache
mkdir %PREFIX%\lib\zowe\zlux\zlux-app-manager
robocopy %SRC_DIR%\zlux-app-manager %PREFIX%\lib\zowe\zlux\zlux-app-manager /E /NS /NC /NFL /NDL /NP /NJH /NJS
mkdir %PREFIX%\lib\zowe\zlux\zlux-server-framework
robocopy %SRC_DIR%\zlux-server-framework %PREFIX%\lib\zowe\zlux\zlux-server-framework /E /NS /NC /NFL /NDL /NP /NJH /NJS
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-app-manager /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-app-manager
robocopy %SRC_DIR%\temp_nonsense %SRC_DIR%\zlux-server-framework /purge /NS /NC /NFL /NDL /NP /NJH /NJS
rmdir %SRC_DIR%\zlux-server-framework
CALL :deletejunk %SRC_DIR%\zlux-app-server
CALL :deletejunk %SRC_DIR%\zlux-shared
CALL :deletejunk %SRC_DIR%\zlux-platform
if not exist %PREFIX%\bin mkdir %PREFIX%\bin
if not exist %PREFIX%\etc mkdir %PREFIX%\etc
rd /S /Q %SRC_DIR%\temp_nonsense
robocopy %SRC_DIR%\build\bin %PREFIX%\bin *.bat /NS /NC /NFL /NDL /NP /NJH /NJS
robocopy %SRC_DIR%\build\etc %PREFIX%\etc * /E /NS /NC /NFL /NDL /NP /NJH /NJS
robocopy %SRC_DIR% %PREFIX%\lib\zowe\zlux * /E /NS /NC /NFL /NDL /NP /NJH /NJS
exit 0

REM combination of del being limited and conda being rediculous
:deletejunk
set tempdir=%cd%
cd %1
del /F /S /Q package.json
del /F /S /Q package-lock.json
del /F /S /Q tsconfig.json
del /F /S /Q tslint.json
del /F /S /Q webpack.config.js
cd %tempdir%
exit /B 0
