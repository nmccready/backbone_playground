@namespace "layouts.to_do_mvc", ->
    class @Header extends Marionette.ItemView
        constructor:(list,templateId = 'template-header',inputId = 'new-todo') ->
            super(list)
            _.extend(@,utils.Backbone)
            @template= @id(templateId)
            @ui= input: @id(inputId)
            @events=
                'keypress #new-todo': 'onInputKeypress'

        onInputKeypress: (evt) ->
            ENTER_KEY = 13
            todoText = @ui.input.val().trim()
            if evt.which is ENTER_KEY and todoText
                @collection.create title: todoText
                @ui.input.val ""