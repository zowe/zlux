#!/bin/bash

# This program and the accompanying materials are
# made available under the terms of the Eclipse Public License v2.0 which accompanies
# this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
# 
# SPDX-License-Identifier: EPL-2.0
# 
# Copyright Contributors to the Zowe Project.

export NODE_PATH=.:./node_modules
export MVD_DESKTOP_DIR=${SRC_DIR}/zlux-app-manager/virtual-desktop
cd zlux-server-framework
rm -rf dco-signoffs
npm install
npm run build
rm -f lib/*.ts
cd ../zlux-shared/src/logging 
npm install 
npm run build
rm -rf node_modules
cd ../obfuscator 
npm install 
npm run build
rm -rf node_modules
rm -rf *.ts
cd ../../../zlux-app-manager
rm -rf dco-signoffs
cd bootstrap
npm install 
npm run build
rm -rf node_modules
rm -rf src
cd ../virtual-desktop 
npm install 
npm run build 
npm run build:externals
npm run i18n
cp node_modules/requirejs/require.js web
#rm -rf src
#rm ts* webpack*
cd nodeServer 
npm install 
npm run build
cd ../
rm -rf nodeServer
cd ../system-apps/app-prop-viewer/webClient
npm install
npm run build
npm run i18n
cd ../
rm -rf webClient
cd ../system-settings-preferences/webClient 
npm install 
npm run build
npm run i18n
cd ../
rm -rf webClient
cd ../admin-notification-app/webClient 
npm install 
npm run build
cd ../
rm -rf webClient
cd ../../../
#rm -rf node_modules src
#rm ts* webpack*
rm -rf */webClient */*/webClient */*/*/webClient */*/*/*/webClient
rm -rf */nodeServer */*/nodeServer */*/*/nodeServer */*/*/*/nodeServer
rm -rf */package-lock.json */*/package-lock.json */*/*/package-lock.json */*/*/*/package-lock.json
rm -rf */xliffmerge.json */*/xliffmerge.json */*/*/xliffmerge.json */*/*/*/xliffmerge.json
rm -rf dco-signoffs */dco-signoffs
rm -rf .git* */.git* */*/.git* */*/*/.git*
rm -rf sonar-project.properties */sonar-project.properties
rm -rf *.ppf */*.ppf
rm -rf **/webpack.config.js **/tslint.json **/tsconfig.json
rm -rf  zlux-shared/test
rm -rf Jenkinsfile */Jenkinsfile
rm -rf .editor* */.editor* */*/.editor*
rm -rf zlux-platform/base
rm -rf zlux-server-framework/test
#copy node_modules in before nuking package.jsons
mkdir -p $PREFIX/lib/zowe/zlux
cp -r zlux-app-manager $PREFIX/lib/zowe/zlux
cp -r zlux-server-framework $PREFIX/lib/zowe/zlux
rm -rf zlux-app-manager zlux-server-framework
rm -rf */package.json */*/package.json */*/*/package.json */*/*/*/package.json
rm -f build/bin/*.bat
cp build/bin/* $PREFIX/bin
mkdir -p $PREFIX/etc
cp -r build/etc/* $PREFIX/etc/
cp -r . $PREFIX/lib/zowe/zlux
rm -rf $PREFIX/lib/zowe/zlux/build
exit 0
