class App.View.Vote extends Backbone.View
  initialize: ->
    @formView = new App.View.VoteForm

  render: ->
    @formView.setElement $("[data-arrogance='swag-form']")
    @formView.render()
