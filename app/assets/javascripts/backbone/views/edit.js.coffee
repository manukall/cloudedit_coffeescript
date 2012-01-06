class DocumentEdit.Views.Edit extends Backbone.View
  template: JST['backbone/templates/document']

  events:
    "submit form": "save"

  initialize: ->
    _.bindAll(@, 'render')
    @model.bind('change', @render)
    @render()

  save: ->
    msg = @model.isNew() ? 'Successfully created!' : 'Saved!'
    @model.save({
      title: @$('[name=title]').val()
      body: @$('[name=body]').val()
      success: (model, resp) ->
        new DocumentEdit.Views.Notice(message: msg)
        @model = model
        @delegateEvents()
        Backbone.history.saveLocation('documents/' + model.id)
    error: ->
      new DocumentEdit.View.Error()
    })
    false

  render: ->
    $(@el).html(@template(model: @model))
    $('#app').html(@el)

    @$('[name=title]').val(@model.get('title'))

