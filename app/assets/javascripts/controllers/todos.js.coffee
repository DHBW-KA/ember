FrontendEmber.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ()->
      title = @get('newTitle');
      return if !title.trim()

      todo = this.store.createRecord 'todo',
        title: title,
        isCompleted: false

      this.set('newTitle', '');

      todo.save();