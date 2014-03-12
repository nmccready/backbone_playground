@namespace "views.old_back", ->
    class @MyView extends Backbone.View
        constructor:(@templateId,options) ->
            super(options)
            @template = HandlebarsTemplates['views/templates/my_view']

        render: =>
            # render the template with the model data
            data = @model.toJSON()
            html = @template(data)
            # populate the view with the rendered html
            @$el.html html