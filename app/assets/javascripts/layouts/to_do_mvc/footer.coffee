@namespace "layouts.to_do_mvc", ->
    class @Footer extends Marionette.Layout
        constructor:(@templateId = 'template-footer') ->
            _.extend(@,$u_Bb)
            @template= @id(@templateId)
            @ui=
                count: "#todo-count strong"
                filters: "#filters a"
            @events=
                "click #clear-completed": "onClearClick"

        initialize: ->
            @listenTo App.vent, "todoList:filter", @updateFilterSelection
            @listenTo @collection, "all", @updateCount

        onRender: ->
            @updateCount()

        updateCount: ->
            count = @collection.getActive().length
            @ui.count.html count
            if count is 0
                @$el.parent().hide()
            else
                @$el.parent().show()

        updateFilterSelection: (filter) ->
            @ui.filters.removeClass("selected").filter("[href=\"#" + filter + "\"]").addClass "selected"

        onClearClick: ->
            completed = @collection.getCompleted()
            completed.forEach destroy = (todo) ->
                todo.destroy()