@namespace "layouts.to_do_mvc", ->
    class @Header extends Marionette.Layout
        constructor:(@templateId = 'template-header',@inputId = 'new-todo') ->
            _.extend(@,utils.Backbone)
            @template= @id(@templateId)
            @ui= input: @id(@inputId)
            @events=
                "keypress #template-header" : "onInputKeypress"

        onInputKeypress: (evt) ->
            ENTER_KEY = 13
            todoText = @ui.input.val().trim()
            if evt.which is ENTER_KEY and todoText
                @collection.create title: todoText
                @ui.input.val ""