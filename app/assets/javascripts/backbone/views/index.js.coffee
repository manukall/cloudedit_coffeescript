class DocumentEdit.Views.Index extends Backbone.View
  initialize: ->
    @documents = @options.documents
    @render()

  render: ->
    if @documents.length > 0
      out = "<h3><a href='#new'>Create New</a></h3><ul>"
      _(@documents).each (item) ->
        out += "<li><a href='#documents/" + item.id + "'>" + item.escape('title') + "</a></li>"
      out += "</ul>"
    else
      out = "<h3>No documents! <a href='#new'>Create one</a></h3>"
    $(@el).html(out)
    $('#app').html(@el)

