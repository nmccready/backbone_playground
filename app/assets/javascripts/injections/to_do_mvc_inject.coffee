TodoMVC = new Backbone.Marionette.Application()
TodoMVC.addRegions
    header: "#header"
    main: "#main"
    footer: "#footer"

TodoMVC.on "initialize:after", ->
    Backbone.history.start()
TodoMVC.module "Layout", (Layout, App, Backbone, Marionette, $, _) ->
    Layout.Header = layouts.to_do_mvc.Header

    Layout.Footer = layouts.to_do_mvc.Footer


TodoMVC.module "TodoList", (TodoList, App, Backbone, Marionette, $, _) ->

    TodoList.Router = Marionette.AppRouter.extend(appRoutes:
        "*filter": "filterItems"
    )

    TodoList.Controller = controllers.to_do_mvc.Controller

    # TodoList Initializer
    # --------------------
    #
    # Get the TodoList up and running by initializing the mediator
    # when the the application is started, pulling in all of the
    # existing Todo items and displaying them.
    TodoList.addInitializer ->
        controller = new TodoList.Controller(TodoMVC,new App.Todos.TodoList())
        new TodoList.Router(controller: controller)
        controller.start()

TodoMVC.module('TodoList.Views', views.to_do_mvc.Views)
new models.to_do_mvc.Models(TodoMVC)
$(->
    TodoMVC.start()
)