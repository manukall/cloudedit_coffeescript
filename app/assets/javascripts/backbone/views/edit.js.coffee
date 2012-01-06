class DocumentEdit.Views.Edit extends Backbone.View
  events:
    "submit form": "save"

  initialize: ->
    @render()

  save: ->
    msg = @model.isNew() ? 'Successfully created!' : 'Saved!'
    @model.save({
      title: @$('[name=title]').val()
      body: @$('[name=body]').val()
      success: (model, resp) ->
        new DocumentEdit.Views.Notice(message: msg)
        @model = model
        @render()
        @delegateEvents()
        Backbone.history.saveLocation('documents/' + model.id)
    error: ->
      new DocumentEdit.View.Error()
    })
    false

  render: ->
    out = '<form>'
    out += "<label for='title'>Title</label>"
    out += "<input name='title' type='text' />"
    out += "<label for='body'>Body</label>"
    out += "<textarea name='body'>" + (@model.escape('body') || '') + "</textarea>"

    submitText = if @model.isNew() then 'Create' else 'Save'

    out += "<button>" + submitText + "</button>"
    out += "</form>"

    $(@el).html(out)
    $('#app').html(@el)

    @$('[name=title]').val(@model.get('title'))

