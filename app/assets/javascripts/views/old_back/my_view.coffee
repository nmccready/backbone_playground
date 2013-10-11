@namespace "views.old_back", ->
    class @MyView extends Backbone.View
        constructor:(@templateId,options) ->
            super(options)
            @template = $("#"+templateId).html()

        render: =>
            # compile the Underscore.js template
            compiledTemplate = _.template(@template)
            # render the template with the model data
            data = @model.toJSON()
            html = compiledTemplate(data)
            # populate the view with the rendered html
            @$el.html html