# frozen_string_literal: true

# PomodorosController
class PomodorosController < ApplicationController
  before_action :set_pomodoro, only: :destroy

  # GET /pomodoros
  def index
    @pomodoros = Pomodoro.all
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
end

