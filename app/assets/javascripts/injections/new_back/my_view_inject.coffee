$(->
    new controllers.old_back.MyViewController("view1",views.new_back.MyView)
    .initialize().render().replace()
)