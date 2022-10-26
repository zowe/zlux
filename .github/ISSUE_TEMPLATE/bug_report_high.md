---
name: High-severity bug report
about: Create a report on a high-severity bug. High severity is when there is an issue that has a major impact on usage of Zowe.
title: ''
labels: bug, new, severity-high
---

<!-- Thanks for deciding to open an issue. Before submitting, please see the following information. -->
<!-- Before opening a new issue, please search our existing issues for similar ones: https://github.com/zowe/zlux/issues -->
<!-- You might also find a solution on our documentation website https://docs.zowe.org/stable/troubleshoot/troubleshooting or by using its search bar -->

**Describe the bug**
<!-- A clear and concise description of the bug or error. -->
A clear and concise description of what the bug is.

**Steps to Reproduce**

1.
2.

**Expected behavior**
<!-- A clear and concise description of what you expected to happen. -->

**Screenshots**
<!-- If applicable, add screenshots to help explain your problem. -->

**Logs**
<!-- If applicable, add server logs collected at the time of your problem. -->
<!-- Logs can contain some system information like hostnames, usernames, and IP/port info. -->
<!-- Please sanitize your logs or reach out to the TSC or ZAC if you need to provide your logs with discretion -->
<!-- Note you can increase log verbosity if desired. -->
<!-- zwe command tracing: Use --trace on a zwe command -->
<!-- zwe startup tracing: Set zowe.launchScript.logLevel to trace (https://github.com/zowe/zowe-install-packaging/blob/677a607686e6ee7ecb349dc5925a6f58dd9e61da/example-zowe.yaml#L356) -->
<!-- app-server tracing: You can set any of the log levels here https://github.com/zowe/zlux-app-server/blob/d1b10b39bd0ba530784144430c33c19a5fb8f935/schemas/app-server-config.json#L378 using the guide here https://docs.zowe.org/stable/user-guide/mvd-configuration#logging-configuration -->
<!-- zss tracing: Similar to app-server tracing, but with these loggers https://github.com/zowe/zss/blob/0bc9c812a5cd5a72768125d13826430e3a5bf1fb/schemas/zss-config.json#L216 -->


**Describe your environment**
<!-- Some items below may not apply to your use case, but answer as best as you can -->

- Zowe version number (Check the Desktop login screen, or manifest.json in the Zowe install folder): 
- Install method (pax, smpe, kubernetes, github clone):
- Operating system (z/OS, kubernetes, etc) and OS version:
- Node.js version number (Shown in logs, or via `node --version`):
- Java version number (Shown in logs, or via `java -version`):
- z/OSMF version:
- Browser:
- Are you accessing the Desktop from the APIML Gateway? (Recommended):
- What is the output of log message ZWES1014I:
- Environment variables in use:


**Additional context**
Add any other context about the problem here.
