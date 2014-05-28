class App.Router extends Backbone.Router
  routes:
    ""     : "showVote"
    "/:id" : "showVote"

  showVote: ->
    @showView App.View.Vote

  showView: (klass) ->
    view = new klass el: $("#content")
    view.render()
