class App.View.VoteForm extends Backbone.View
  events:
    "click input" : "onChoose"

  onChoose: (e) ->
    @$el.submit()
