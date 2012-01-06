class DocumentEdit.Views.Index extends Backbone.View
  template: JST['backbone/templates/documents_collection']

  initialize: ->
    @documents = @options.documents
    @render()

  render: ->
    $(@el).html(@template(collection: @collection))
    $('#app').html(@el)

