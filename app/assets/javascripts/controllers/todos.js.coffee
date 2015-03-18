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
    clearCompleted: ()->
      completed = @filterBy 'isCompleted', true
      completed.invoke('deleteRecord');
      completed.invoke('save');

  remaining: (()->
    @filterBy('isCompleted', false).get 'length'
  ).property '@each.isCompleted'

  inflection: (()->
    remaining = @get 'remaining'
    if remaining == 1 then 'item' else 'items'
  ).property 'remaining'

  hasCompleted: (()->
    @get('completed') > 0
  ).property 'completed'

  completed: (()->
    @filterBy('isCompleted', true).get 'length'
  ).property '@each.isCompleted'

  allAreDone: ((key, value)->
    if value == undefined
      !!@get('length') && @isEvery('isCompleted');
    else
      @setEach('isCompleted', value);
      @invoke('save');
      value;
  ).property '@each.isCompleted'