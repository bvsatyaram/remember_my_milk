class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.all
    @new_task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
end
