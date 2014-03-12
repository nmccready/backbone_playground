@namespace "controllers.to_do_mvc", ->
    class @MyViewController extends Marionette.Controller
        constructor: (@region, @viewFactory = views.new_back.MyView,
                      @person = new models.old_back.Person("Nick", "McCready", "nem@example.com")) ->
            super()
            @myView = new @viewFactory(model: @person)
            @
        show: ()=>
            @region.show(@myView)

@namespace "controllers.new_back", ->
    class @MyViewController extends Marionette.Controller
        constructor: (@region, @viewFactory = views.new_back.MyView,
                      @person = new models.old_back.Person("Nick", "McCready", "nem@example.com")) ->
            super()
            @myView = new @viewFactory(model: @person)
            @
        show: ()=>
            @region.show(@myView)