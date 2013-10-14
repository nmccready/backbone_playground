@namespace "utils", ->
    @Backbone =
        append:(toAppend,name)->
            toAppend + name
        id:(name)->
            utils.Backbone.append('#',name)
        class:(name)->
            utils.Backbone.append('.',name)