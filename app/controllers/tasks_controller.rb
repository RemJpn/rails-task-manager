class TasksController < ApplicationController
  # As a user, I can list tasks
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  # As a user, I can view the details of a task
  def show
  end

  # As a user, I can add a new task
  def new
    @task = Task.new
  end

  def create
    new_task = Task.new(task_params)
    new_task.save
    redirect_to tasks_path
  end

  # As a user, I can edit a task (mark as completed / update title & details)
  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(params[:id])
  end

  # # As a user, I can remove a task
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
