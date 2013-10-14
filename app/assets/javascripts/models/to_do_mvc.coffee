@namespace "models.to_do_mvc", ->
    class @Models
        constructor:(app)->
            app.module "Todos", (Todos, App, Backbone, Marionette, $, _) ->

                # Todo Model
                # ----------
                Todos.Todo = Backbone.Model.extend(
                    localStorage: new Backbone.LocalStorage("todos-backbone")
                    defaults:
                        title: ""
                        completed: false
                        created: 0

                    initialize: ->
                        @set "created", Date.now()  if @isNew()

                    toggle: ->
                        @set "completed", not @isCompleted()

                    isCompleted: ->
                        @get "completed"
                )

                # Todo Collection
                # ---------------
                Todos.TodoList = Backbone.Collection.extend(
                    model: Todos.Todo
                    localStorage: new Backbone.LocalStorage("todos-backbone")
                    getCompleted: ->
                        @filter @_isCompleted

                    getActive: ->
                        @reject @_isCompleted

                    comparator: (todo) ->
                        todo.get "created"

                    _isCompleted: (todo) ->
                        todo.isCompleted()
                )
