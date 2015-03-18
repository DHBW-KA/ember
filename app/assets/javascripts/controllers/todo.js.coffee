FrontendEmber.TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ()->
      @set 'isEditing', true

    acceptChanges: ->
      @set 'isEditing', false
      if Ember.isEmpty(@get('model.title'))
        @send 'removeTodo'
      else
        @get('model').save()
      return

    removeTodo: ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()

  isEditing: false

  isCompleted: ((key, value) ->
    model = @get('model')
    if value == undefined
      # property being used as a getter
      model.get 'isCompleted'
    else
      # property being used as  setter
      model.set 'isCompleted', value
      model.save()
      value
  ).property('model.isCompleted')
