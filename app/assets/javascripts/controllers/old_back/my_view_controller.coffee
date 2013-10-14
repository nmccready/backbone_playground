@namespace "controllers.old_back", ->
    class @MyViewController extends foundation.BaseObject
        constructor: (@contentId,@templateId,
                      @viewFactory = views.old_back.MyView,
                      @person = new models.old_back.Person("Derick", "Bailey", "derickbailey@example.com")) ->
            @
        initialize: ()=>
            @myView = new @viewFactory(@templateId,model: @person)
            @
        render: ()=>
            @myView.render()
            @
        replace: ()=>
            $('#'+@contentId).html @myView.el
            @