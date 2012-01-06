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
    $.getJSON('/documents', (data) ->
      if data
        documents = _(data).map (i) -> new DocumentEdit.Models.Document(i)
        new window.DocumentEdit.Views.Index(documents: documents)
      else
        new Error(message: "Error loading documents.")
    )

  newDoc: ->
    new DocumentEdit.Views.Edit(model: new DocumentEdit.Models.Document())
