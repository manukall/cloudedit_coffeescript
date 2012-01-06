class DocumentEdit.Routers.Documents extends Backbone.Router
  routes:
    "documents/:id":  	"edit",
    "new":    		"newDoc"
    "":       		"index"

  edit: (id) ->
    doc = new DocumentEdit.Models.Document({ id: id})
    doc.fetch(
      success: (model, resp) ->
        new window.DocumentEdit.Views.Edit(model: doc)
      error: ->
        new Error(message: 'Could not find that document.')
        window.location.hash = '#'
    )

  index: ->
    documents = new DocumentEdit.Collections.Documents()
    documents.fetch(
      success: =>
        new DocumentEdit.Views.Index(collection: documents)
      error: ->
        new Error(message: 'Error loading documents.')
    )

  newDoc: ->
    new DocumentEdit.Views.Edit(model: new DocumentEdit.Models.Document())
