# frozen_string_literal: true

# PomodorosController
class PomodorosController < ApplicationController
  before_action :set_pomodoro, only: [:show, :destroy]

  # GET /pomodoros
  def index
    @pomodoros = Pomodoro.all
  end

  # GET /pomodoros/1
  def show
  end

  # GET /pomodoros/new
  def new
    @pomodoro = Pomodoro.new
  end

  # POST /pomodoros
  def create
    @pomodoro = Pomodoro.new(pomodoro_params)

    if @pomodoro.save
      redirect_to @pomodoro, notice: "Pomodoro was successfully created."
    else
      render :new
    end
  end

  # DELETE /pomodoros/1
  def destroy
    @pomodoro.destroy
    redirect_to pomodoros_url, notice: "Pomodoro was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pomodoro
    @pomodoro = current_user.pomodoros.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def pomodoro_params
    params.require(:pomodoro).permit(:task_id)
  end
end

