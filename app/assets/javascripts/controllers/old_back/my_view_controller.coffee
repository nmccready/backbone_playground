@namespace "controllers.old_back", ->
    class @MyViewController extends foundation.BaseObject
        constructor: (@person = new models.old_back.Person("Derick", "Bailey", "derickbailey@example.com")) ->
            @
        initialize: ()=>
            @myView = new views.old_back.MyView(model: @person)
            @
        render: ()=>
            @myView.render()
            @
        replace: ()=>
            $("#view1").html @myView.el
            @

$(->
    new controllers.old_back.MyViewController().initialize().render().replace()
)