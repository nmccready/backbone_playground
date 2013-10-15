@namespace "controllers.to_do_mvc", ->
    class @Controller extends Marionette.Controller
        constructor: (@app,@toDoList)->

        start: =>
            @showHeader @toDoList
            @showFooter @toDoList
            @showTodoList @toDoList
            @toDoList.fetch()

        showHeader: (todoList) =>
            header = new @app.Layout.Header(collection: todoList)
            @app.header.show header

        showFooter: (todoList) =>
            footer = new @app.Layout.Footer(collection: todoList,@app)
            @app.footer.show footer

        showTodoList: (todoList) =>
            @app.main.show new @app.TodoList.Views.ListView(collection: todoList)

        filterItems: (filter) =>
            @app.vent.trigger "todoList:filter", filter.trim() or "" if filter?