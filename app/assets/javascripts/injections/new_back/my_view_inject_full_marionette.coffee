$(->
    App = new Marionette.Application()
    App.addRegions("view2": "#view2")
    new controllers.new_back.MyViewController(App.view2,'my-view-template',views.new_back.MyView).show()
)