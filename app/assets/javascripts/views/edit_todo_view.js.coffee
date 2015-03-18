FrontendEmber.EditTodoView = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()
    return

Ember.Handlebars.helper 'edit-todo', FrontendEmber.EditTodoView