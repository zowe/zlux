# Application Conformance Summary

An Application must follow meet the following requirements to align with the Zowe Conformance Program:

Web
* DOM elements should not be placed on a parent that is above the provided Zowe viewport (and if present, Zowe Window)
* Network requests to other Apps and Zowe Services must be made through the URI Broker whenever possible.
    * If a route to a Zowe Service is not yet present in the URI Broker, an exception is granted after logging a request for inclusion of said service
* Apps must not pollute the global namespace with regards Javascript, HTML, and CSS
    * JS: Your app must not add attributes to `window` global object of the webpage, except an attribute equal to the App's identifier if needed.
    * CSS: Style bleed is forbidden, but techniques to prevent it vary by toolkit. Below are some suggestions
        * Angular: Making use of View Encapsulation
        * React: CSS Modules, or techniques as described in https://speakerdeck.com/vjeux/react-css-in-js
* When using a library present in the Zowe base, you must depend on the same version.
    * See https://github.com/zowe/zlux/wiki/Web-Externals-Bundle
    * See https://github.com/zowe/zlux-app-manager/blob/master/bootstrap/package-lock.json
    * See https://github.com/zowe/zlux-app-manager/blob/master/virtual-desktop/package.json
    
Web **Recommendations**
* Web apps should extend the framework's default build scripts for webpack and typescript
    * Example Webpack Angular: https://github.com/zowe/sample-react-app/blob/master/webClient/webpack.config.js
    * Example Webpack React: https://github.com/zowe/sample-react-app/blob/master/webClient/webpack.config.js
    * Example Typescript Angular: https://github.com/zowe/sample-angular-app/blob/master/webClient/tsconfig.json
    * Example Typescript React: https://github.com/zowe/sample-react-app/blob/master/webClient/tsconfig.json
* Web and service code that depends on NPM libraries should depend on specific or patch level ("~") variant versions, rather than the default minor-level ("^")

Localization and Internationalization (l10n and i18n)
* The active language to be used for string selection must be retrieved using ZoweZLUX.globalization.getLanguage(), which determines language by multiple factors.
    * Using the desktop language setting or operating system language is not allowed.

i18n **Recommendations**
* No strings visible in a UI should be hard-coded, rather resource strings must be used in accordance with one of the existing internationalization support mechanisms.
    * Logs should not be internationalized due to difficulty of support.

Packaging
* Every plugin must have a unique ID. The ID format follows java package naming conventions. The Zowe project reserves `org.zowe`.
* Every plugin and each of its services must have a version. 
    * All versions are to be formatted according to semver. Semver allows for 1.2.3[-alpha/beta][+customstring].
        * If you are accustomed to 1.2.3.4 versioning, with semver this becomes 1.2.3+4
    * See link for reference: https://semver.org/
* The following directory layout must be adhered to (See: https://github.com/zowe/zlux/wiki/ZLUX-App-filesystem-structure)
    * App web content (static files such as images, HTML, JS) must be placed into the `web` directory.
    * App service content (REST and Websocket APIs) must be placed into the `lib` directory.
    * Documentation must go into the `doc` directory
        * Except for README.md, LICENSE.md, and discretionarily other traditionally top-level markdown files
* In addition, the following source code layout is recommended for tooling consistency (See: https://github.com/zowe/zlux/wiki/ZLUX-App-filesystem-structure)
    * Code that generates the output for the `web` directory should be within `webContent`
    * Code that generates the output for nodeJS services that go into `lib` should be within `nodeService`
    * Code that generates the output for ZSS services that go into `lib` should be within `zssService`
    
Documentation
* Every HTTP API must be documented in swagger 2.0. The swagger document must be stored in `doc/swagger`
    * In addition, it is recommended to have documentation about the format of any Websocket APIs, to be placed within `doc`
    
Logging
* Apps web components, or App Framework services (eg Javascript and Typescript) must log only through the "zlux" logger.
  Use of console.log is forbidden. See https://github.com/zowe/zlux/wiki/Logging
* ZSS services log only through the Zowe ZSS Logger. See https://github.com/zowe/zlux/wiki/Logging and https://github.com/zowe/zowe-common-c/blob/master/c/logging.c
* Passwords must never be logged

Logging **Recommendations**
* Error reporting should follow the standard tooling
    * Web reference: https://github.com/zowe/zlux/wiki/Error-Reporting-UI
    * Service reference: https://github.com/zowe/zlux-proxy-server/pull/8

Storage
* User preferences, if applicable to a plugin, must be stored through the configuration data service.
  * Exceptions may be granted for software that uses pre-existing storage structures, such as in DB2.
  * See link for reference: https://github.com/zowe/zlux/wiki/Configuration-Dataservice
