@namespace "views.to_do_mvc", ->
    @ListView =
        Marionette.CompositeView.extend(
            template: "#template-todoListCompositeView"
            itemView: self.ItemView
            itemViewContainer: "#todo-list"
            ui:
                toggle: "#toggle-all"

            events:
                "click #toggle-all": "onToggleAllClick"

            collectionEvents:
                all: "update"

            onRender: ->
                @update()

            update: ->
                reduceCompleted = (left, right) ->
                    left and right.get("completed")
                allCompleted = @collection.reduce(reduceCompleted, true)
                @ui.toggle.prop "checked", allCompleted
                @$el.parent().toggle !!@collection.length

            onToggleAllClick: (e) ->
                isChecked = e.currentTarget.checked
                @collection.each (todo) ->
                    todo.save completed: isChecked
        )