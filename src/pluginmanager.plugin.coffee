# Export Plugin
module.exports = (BasePlugin) ->
    fs = require('safefs')
    path = require('path')
    # Define Plugin
    class PluginmanagerPlugin extends BasePlugin
        # Plugin name
        name: 'pluginmanager'

        # Config
        config:
            readmeURL: '/admin/plugins/:pluginName/readme'
            packageURL: '/admin/plugins/:pluginName/package'
        
        #swallow file errors which just
        #mean a file doesn't exist in one
        #of the plugin paths
        fileError: (err) ->
            
        # Extend Template Data
        # Use to inject new template data variables and helpers into the template data
        extendTemplateData: (opts) ->
            # Prepare
            {templateData} = opts
            
            loadedPlugins = @docpad.loadedPlugins

            templateData.loadedPlugins = loadedPlugins
            pluginsPaths = @docpad.getConfig().pluginsPaths
            pluginsDesc = {}
            fileError = @fileError
            for name, val of loadedPlugins
                pluginsPaths.forEach (dirPath) ->
                    try
                        file = path.join(dirPath,'docpad-plugin-'+name,'package.json')
                        txt = fs.readFileSync(file,'utf-8')
                        obj = JSON.parse(txt)
                        if !loadedPlugins[name].description
                            loadedPlugins[name].description = obj.description
                    catch err
                        fileError(err)
            
            #Chain
            @
            
        # Server Extend
        # Used to add our own custom routes to the server before the docpad routes are added
        serverExtend: (opts) ->
            # Extract the server from the options
            {server} = opts
            plugin = @
            docpad = @docpad
            docpadConfig = docpad.getConfig()
            config = @getConfig()
            fileError = @fileError
            
                    
            server.get config.readmeURL, (req,res,next) ->
                name = req.params.pluginName
                if name
                    pluginsPaths = docpadConfig.pluginsPaths
                    txt = ""
                    pluginsPaths.forEach (dirPath) ->
                        try
                            file = path.join(dirPath,'docpad-plugin-'+name,'README.md')
                            txt = fs.readFileSync(file,'utf-8')
                        catch err
                            fileError(err)

                    res.send(txt)
                else
                    res.status(500).json({success:false,msg:"no plugin name"})


            server.get config.packageURL, (req,res,next) ->
                name = req.params.pluginName
                if name
                    pluginsPaths = docpadConfig.pluginsPaths
                    txt = ""
                    pluginsPaths.forEach (dirPath) ->
                        try
                            file = path.join(dirPath,'docpad-plugin-'+name,'package.json')
                            txt = fs.readFileSync(file,'utf-8')
                        catch err
                            fileError(err)

                    res.send(txt)
                else
                    res.status(500).json({success:false,msg:"no plugin name"})

        
        
        
        
        
         
         

