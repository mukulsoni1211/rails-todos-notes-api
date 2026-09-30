class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  def index
    todos = current_user.todos.order(created_at: :desc)

    render json: todos
  end

  def create
    todo = current_user.todos.create!(todo_params)

    render json: todo, status: :created
  end

  def update
    @todo.update!(todo_params)

    render json: @todo
  end

  def destroy
    @todo.destroy!

    head :no_content
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :status, :due_date, :priority)
  end
end
