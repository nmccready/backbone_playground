@namespace "controllers.to_do_mvc", ->
    class @MyViewController extends Marionette.Controller
        constructor: (@region,@templateId,\
                      @viewFactory = views.new_back.MyView,
                      @person = new models.old_back.Person("Nick", "McCready", "nem@example.com")) ->
            super()
            @myView = new @viewFactory(@templateId,model: @person)
            @
        show: ()=>
            @region.show(@myView)