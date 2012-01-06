class DocumentEdit.Models.Document extends Backbone.Model
  url: ->
    base = 'documents'
    return base if @isNew()
    base + '/' + @id

class DocumentEdit.Collections.Documents extends Backbone.Collection
  url: '/documents'
  model: DocumentEdit.Models.Document
