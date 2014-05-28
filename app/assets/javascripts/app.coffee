#= require init

$ ->
  App.router = new App.Router

  App.start = ->
    Backbone.history.start pushState: true
  App.start()
