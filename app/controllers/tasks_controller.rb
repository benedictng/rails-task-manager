class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, alert: 'Task created successfully.'
    else
      redirect_to new_task_path, alert: 'Error creating task.'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, alert: 'Task updated successfully.'
    else
      redirect_to new_task_path, alert: 'Error updating task.'
    end
  end

  def destroy
    @task.delete
    redirect_to tasks_path, alert: 'Task updated successfully.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
