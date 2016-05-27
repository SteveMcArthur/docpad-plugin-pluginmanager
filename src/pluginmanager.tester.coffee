# Export Plugin Tester
module.exports = (testers) ->
    # PRepare
    {expect} = require('chai')
    fs = require('safefs')
    util = require('util')
    request = require('request')


    # Define My Tester
    class PluginManagerTester extends testers.ServerTester
        # Test Generate
        #testGenerate: testers.RendererTester::testGenerate
        testCreate: ->
            tester = @
            
            super

        # Custom test for the server
        testServer: (next) ->
            # Prepare
            tester = @

            # Create the server
            super
 
            # Test
            @suite 'plugin properties', (suite,test) ->
                # Prepare
                
                plugin = tester.docpad.getPlugin('pluginmanager')
                config = plugin.getConfig()
                
                
                @suite 'config properties exist', (suite,test,done) ->
                    expectedConfig = [
                        "readmeURL",
                        "packageURL"
                    ]

                    expectedConfig.forEach (item) ->
                        test item+' property', () ->
                            expect(config).to.have.property(item)
                    
                    done()
                    
            @suite 'request readme', (suite,test) ->
                plugin = tester.docpad.getPlugin('pluginmanager')
                config = plugin.getConfig()
                baseUrl = "http://localhost:"+tester.docpad.config.port
                readme = ""
                test 'get', (done) ->
                    fileUrl = "#{baseUrl}/admin/plugins/marked/readme"
                    request fileUrl, (err,response,body) ->
                        readme = body
                        expect(err).to.not.be.ok
                        console.log("Got readme")
                        done()
                test 'readme has content', (done) ->
                    expect(readme).to.have.length.above(0)
                    done()
                    
            @suite 'request package.json', (suite,test) ->
                plugin = tester.docpad.getPlugin('pluginmanager')
                config = plugin.getConfig()
                baseUrl = "http://localhost:"+tester.docpad.config.port
                pkg = ""
                test 'get', (done) ->
                    fileUrl = "#{baseUrl}/admin/plugins/marked/package"
                    request fileUrl, (err,response,body) ->
                        pkg = body
                        expect(err).to.not.be.ok
                        console.log("Got readme")
                        done()
                test 'package has content', (done) ->
                    expect(pkg).to.have.length.above(0)
                    done()