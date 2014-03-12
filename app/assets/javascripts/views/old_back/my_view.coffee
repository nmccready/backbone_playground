@namespace "views.old_back", ->
    @MyView = Backbone.View.extend
        template: HandlebarsTemplates['views/templates/my_view']

        render: ->
            # render the template with the model data
            data = @model.toJSON()
            html = @template(data)
            # populate the view with the rendered html
            @$el.html html