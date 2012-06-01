FormView = require 'views/form_view'
template = require 'views/templates/new_post_form'

module.exports = class NewPostFormView extends FormView
  template: template
  className: 'topic-post topic-post-create'
  saveEvent: 'post:new'

  initialize: ->
    super
    @pass 'text', '.topic-new-post-body'
    @delegate 'keyup keydown', '.topic-new-post-body', @changeText

  # Update model data by default, save on ⌘R.
  changeText: (event) =>
    if event.metaKey and event.keyCode is 13
      @$el.trigger('submit')
    else
      @model.set(text: $(event.currentTarget).val())
