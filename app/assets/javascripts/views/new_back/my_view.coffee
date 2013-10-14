@namespace "views.to_do_mvc", ->
    class @MyView extends Marionette.ItemView
        constructor: (@templateId, model) ->
            super(model)
            @template = "#" + templateId