require "test_helper"

class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully!'
    else
      render :new
    end
  end

  class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
  end

  class TasksController < ApplicationController
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path, notice: 'Task deleted successfully!'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
