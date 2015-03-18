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

  remaining: (()->
    @filterBy('isCompleted', false).get 'length'
  ).property('@each.isCompleted')

  inflection: (()->
    remaining = @get 'remaining'
    if remaining == 1 then 'item' else 'items'
  ).property('remaining')