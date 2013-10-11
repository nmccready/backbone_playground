@namespace "controllers.old_back", ->
    class @MyViewController extends foundation.BaseObject
        constructor: (@contentId,@templateId,@person = new models.old_back.Person("Derick", "Bailey", "derickbailey@example.com")) ->
            @
        initialize: ()=>
            @myView = new views.old_back.MyView(@templateId,model: @person)
            @
        render: ()=>
            @myView.render()
            @
        replace: ()=>
            $('#'+@contentId).html @myView.el
            @