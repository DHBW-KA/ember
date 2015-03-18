
FrontendEmber.TodosIndexRoute = Ember.Route.extend
  model: ()->
    @store.find 'todo'