# Plugin Manager Plugin for [DocPad](http://docpad.org)

[![Build Status](https://img.shields.io/travis/SteveMcArthur/docpad-plugin-pluginmanager/master.svg)](https://travis-ci.org/SteveMcArthur/docpad-plugin-pluginmanager "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/docpad-plugin-pluginmanager.svg)](https://www.npmjs.com/package/docpad-plugin-pluginmanager "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/docpad-plugin-pluginmanager.svg)](https://www.npmjs.com/package/docpad-plugin-pluginmanager "View this project on NPM")

Docpad plugin that enables the viewing and managing of plugins from within a docpad website. It's designed to function as part of a admin/CMS interface.

![Screen shot](https://raw.githubusercontent.com/SteveMcArthur/docpad-plugin-pluginmanager/master/screenshot.jpg)

At the moment it adds the list of installed plugins to the docpad templateData which makes this data available to application templates. It also adds a description field to each plugin, pulled from the package.json file for each plugin and makes available data URLs to retrieve a plugin's readme file or package.json.

### Default configuration
```coffee
        config:
            readmeURL: '/admin/plugins/:pluginName/readme'
            packageURL: '/admin/plugins/:pluginName/package'
```
## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2016+ Steve McArthur <steve@stevemcarthur.co.uk> (http://www.stevemcarthur.co.uk)