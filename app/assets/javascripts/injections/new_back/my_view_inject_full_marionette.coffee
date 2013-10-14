$(->
    new controllers.new_back.MyViewController(new Marionette.Region(el: '#view2'),
            'my-view-template',views.new_back.MyView).show()
)