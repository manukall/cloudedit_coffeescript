class DocumentEdit.Models.Document extends Backbone.Model
  url: ->
    base = 'documents'
    return base if @isNew()
    base + '/' + @id
