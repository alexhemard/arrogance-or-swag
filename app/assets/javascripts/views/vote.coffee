class App.View.Vote extends Backbone.View
  initialize: ->
    @formView = new App.View.VoteForm

  render: ->
    imagesLoaded @$(".last-vote img"), =>
      @$(".last-vote-swag, .last-vote-arrogant").css("display", "block")

    @formView.setElement $("[data-arrogance='swag-form']")
    @formView.render()
