# Test our plugin using DocPad's Testers
testerConfig =
    pluginPath: __dirname+'/..'
    autoExit: 'safe'
require('docpad').require('testers')
    .test(testerConfig)