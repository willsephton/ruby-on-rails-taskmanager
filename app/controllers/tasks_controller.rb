class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task created!"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task updated!"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    removed_id = @task.id
    @task.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("task_#{removed_id}") }
      format.html { redirect_to tasks_path, notice: "Task deleted!" }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
