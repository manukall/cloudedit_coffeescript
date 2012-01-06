#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.DocumentEdit =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new DocumentEdit.Routers.Documents()
    Backbone.history.start()
