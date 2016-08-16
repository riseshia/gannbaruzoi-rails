# frozen_string_literal: true
require "test_helper"

class PomodoroTest < ActiveSupport::TestCase
  def test_valid
    pomodoro = build(:pomodoro)
    assert pomodoro.valid?
  end
end

