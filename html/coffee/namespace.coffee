class cldoc.Namespace extends cldoc.Node
    @title = ['Namespace', 'Namespaces']

    constructor: (@node) ->
        super(@node)

    render: (container) ->
        div = $('<div class="item"/>')
        container.append(div)

        a = cldoc.Page.make_link(@ref, @name)
        a.attr('id', @id)

        div.append(a)
        div.append(new cldoc.Doc(@brief).render())

        classes = @node.children('class,struct')

        if classes.length > 0
            tb = $('<table class="namespace"/>')

            for cls in classes
                cls = $(cls)

                row = $('<tr/>')
                a = cldoc.Page.make_link(cls.attr('ref'), cls.attr('name'))
                row.append($('<td/>').append(a))
                row.append($('<td class="doc"/>').append(cldoc.Doc.either(cls)))
                tb.append(row)

            div.append(tb)

cldoc.Node.types.namespace = cldoc.Namespace

# vi:ts=4:et
