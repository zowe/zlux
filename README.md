This program and the accompanying materials are
made available under the terms of the Eclipse Public License v2.0 which accompanies
this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html

SPDX-License-Identifier: EPL-2.0

Copyright Contributors to the Zowe Project.
# Giza Foundation

This is the project home of the Giza Foundation. Within, there are several repositories and superprojects which help to categorize the components available for use.

#### This project is in active development and documentation may be brief at this time. Feel free to contribute to the Wiki and we'll keep the READMEs updated over time.

If you want to get started with a Zoe project for the first time, it is best to start by cloning this "zlux" repository. Contained within is a flat collection of subrepositories which are a set of sample Apps for Zoe, the Zoe Framework, and an example Zoe App server that pulls it all together.

#### Note: Due to the build system of Zoe using relative paths, the superprojects "zlux-apps" and "zlux-framework" are not recommended to be used at this time as the addition of another level of depth to the folder structure would cause relative paths to not resolve.

New users should take a look at [zlux-example-server](https://github.com/gizafoundation/zlux-example-server) to see how a simple Zoe App server is assembled. You'll see the build scripts used to create the deploy/runtime folder structure needed, and a JS file that creates a custom implementation of the Zoe nodeJS-based server.

#### Note: When using zlux-example-server or any Zoe server which needs to make use of the Rocket ZSS (Z Secure Services) Server or the Rocket TN3270/Unix terminal emulator, please reach out to Rocket members of Zoe who can help to provide you with the external content required for these. In zlux-example-server in particular, you'll see references to "externals/Rocket" where Rocket content external to Github should be placed for full functionality.

This program and the accompanying materials are
made available under the terms of the Eclipse Public License v2.0 which accompanies
this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html

SPDX-License-Identifier: EPL-2.0

Copyright Contributors to the Zowe Project.