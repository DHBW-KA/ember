class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def create
    todo = Todo.create! resource_params
    render json: todo, status: :created
  end

  private
    def resource_params
      params.require(:todo).permit(:id, :title, :is_completed)
    end

end
