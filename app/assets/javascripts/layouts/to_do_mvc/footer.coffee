@namespace "layouts.to_do_mvc", ->
    class @Footer extends Marionette.Layout
        constructor:(list,@app,@templateId = 'template-footer') ->
            super(list)
            _.extend(@,utils.Backbone)
            @template= @id(@templateId)
            @ui=
                filters: "#filters a"
            @events=
                'click #clear-completed': 'onClearClick'

        collectionEvents:
            all: "render"

        templateHelpers:
            activeCountLabel: ->
                ((if @activeCount is 1 then "item" else "items")) + " left"

        initialize: ->
            @listenTo @app.vent, "todoList:filter", @updateFilterSelection, this

        serializeData: ->
            active = @collection.getActive().length
            total = @collection.length
            activeCount: active
            totalCount: total
            completedCount: total - active

        onRender: ->
            @$el.parent().toggle @collection.length > 0
            @updateFilterSelection()

        updateFilterSelection: ->
            @ui.filters.removeClass("selected").filter("[href=\"" + (location.hash or "#") + "\"]").addClass "selected"

        onClearClick: ->
            completed = @collection.getCompleted()
            completed.forEach (todo) ->
                todo.destroy()