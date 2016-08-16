# frozen_string_literal: true
require "test_helper"

class PomodoroTest < ActiveSupport::TestCase
  def pomodoro
    @pomodoro ||= Pomodoro.new
  end

  def test_valid
    assert pomodoro.valid?
  end
end

