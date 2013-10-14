$(->
    new controllers.old_back.MyViewController("view1",'my-view-template',views.new_back.MyView)
    .initialize().render().replace()
)