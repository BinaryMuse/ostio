FormView = require 'views/base/form-view'
template = require './templates/new-post-form'

module.exports = class NewPostFormView extends FormView
  className: 'post post-create'
  saveEvent: 'post:new'
  template: template

  initialize: ->
    super
    @pass 'text', '.new-post-body'
    @delegate 'keyup keydown', '.new-post-body', @changeText

  # Update model data by default, save on ⌘R.
  changeText: (event) =>
    text = $(event.currentTarget).val().trim()
    if event.metaKey and event.keyCode is 13
      @$el.trigger('submit')
    else
      @model.set {text}
