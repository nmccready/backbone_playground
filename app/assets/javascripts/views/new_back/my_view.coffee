@namespace "views.to_do_mvc", ->
    class @MyView extends Marionette.ItemView
        constructor: (@templateId, model) ->
            super(model)
            @template = "#" + templateId


@namespace "views.new_back", ->
views.new_back.MyView = Marionette.ItemView.extend
    template: HandlebarsTemplates['views/templates/my_view']