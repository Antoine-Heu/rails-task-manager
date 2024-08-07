class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def check
    @task = Task.find(params[:id])
    if @task.completed
      @task.completed = false
    else
      @task.completed = true
    end
    @task.save
    redirect_to tasks_path
  end

  # def checked
  #   @checked = true
  #   if @task.completed?


  # end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
