@namespace = (names, fn) ->
    names = names.split '.' if typeof names is 'string'
    space = @[names.shift()] ||= {}
    space.namespace ||= @namespace
    if names.length
        space.namespace names, fn
    else
        fn.call space