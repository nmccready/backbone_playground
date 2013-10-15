@namespace "views.to_do_mvc",->
    class @Views
        constructor:(Views, App, Backbone, Marionette, $, _) ->
            # Todo List Item View
            # -------------------
            #
            # Display an individual todo item, and respond to changes
            # that are made to the item, including marking completed.
            Views.ItemView = views.to_do_mvc.ListItemView

            # Item List View
            # --------------
            #
            # Controls the rendering of the list of items, including the
            # filtering of active vs completed items for display.
            Views.ListView = views.to_do_mvc.ListView

            # Application Event Handlers
            # --------------------------
            #
            # Handler for filtering the list of items by showing and
            # hiding through the use of various CSS classes
            App.vent.on "todoList:filter", (filter) ->
                filter = filter or "all"
                $("#todoapp").attr "class", "filter-" + filter

