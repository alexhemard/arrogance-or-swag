class App.View.Vote extends Backbone.View
  initialize: ->
    @formView = new App.View.VoteForm

  render: ->
    @formView.el = $("[data-arrogance='swag-form']")
    @formView.render()
