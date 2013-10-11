@namespace "models.old_back", ->
    class @Person extends Backbone.Model
        constructor: (@firstName, @lastName, @email)->
            super(@)
