# frozen_string_literal: true

# TasksController
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update,
                                  :destroy, :log, :done]

  # GET /tasks
  def index
    @tasks = Task.main_task_of(current_user.id).includes(:subtasks)
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new(parent_task_id: parent_task_id)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.init_with_user(task_params, current_user)

    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  # PATCH /tasks/1/log
  def log
    if @task.add_log
      redirect_to tasks_path, notice: "Pomodoro was successfully added."
    else
      redirect_to tasks_path, notice: "Pomodoro was not added."
    end
  end

  # PATCH /tasks/1/done
  def done
    if @task.toggle!(:done_flg)
      redirect_to tasks_path, notice: "Task was successfully done."
    else
      redirect_to tasks_path, notice: "Task was not done."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def parent_task_id
    return nil unless params[:parent_task_id]
    Task.find_by_id(params[:parent_task_id])&.id
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def task_params
    params
      .require(:task)
      .permit(:description, :estimated_pomodoro, :parent_task_id)
  end
end

