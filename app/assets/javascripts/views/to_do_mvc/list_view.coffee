@namespace "views.to_do_mvc", ->
    class @ListView
        constructor: (@itemView)->
            self = @
            Marionette.CompositeView.extend(
                template: "#template-todoListCompositeView"
                itemView: self.itemView
                itemViewContainer: "#todo-list"
                ui:
                    toggle: "#toggle-all"

                events:
                    "click #toggle-all": "onToggleAllClick"

                initialize: ->
                    @listenTo @collection, "all", @update

                onRender: ->
                    @update()

                update: ->
                    reduceCompleted = (left, right) ->
                        left and right.get("completed")
                    allCompleted = @collection.reduce(reduceCompleted, true)
                    @ui.toggle.prop "checked", allCompleted
                    if @collection.length is 0
                        @$el.parent().hide()
                    else
                        @$el.parent().show()

                onToggleAllClick: (evt) ->
                    isChecked = evt.currentTarget.checked
                    @collection.each (todo) ->
                        todo.save completed: isChecked

            )