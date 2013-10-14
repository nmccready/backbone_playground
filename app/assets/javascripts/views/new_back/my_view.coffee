@namespace "views.new_back", ->
    class @MyView extends Marionette.ItemView
        constructor: (@templateId, model) ->
            super(model)
            @template = "#" + templateId