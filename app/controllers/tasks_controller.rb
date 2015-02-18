class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @task = Task.create(task_params)
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
end
