@namespace "views.to_do_mvc", ->
    class @MyView extends Marionette.ItemView
        constructor: (@templateId, model) ->
            super(model)
            @template = "#" + templateId


@namespace "views.new_back", ->
    class @MyView extends Marionette.ItemView
        constructor: (@templateId, model) ->
            super(model)
            @template = HandlebarsTemplates['views/templates/my_view']