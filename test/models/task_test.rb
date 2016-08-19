# frozen_string_literal: true
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:pomodoros)

  def test_valid
    task = build(:task)
    assert task.valid?
  end

  def test_init_with_user
    user = build(:user)
    task = Task.init_with_user(params, user)
    assert task.is_a?(Task)
    assert task.valid?
  end

  private

  def params
    {
      description: "Description",
      estimated_pomodoro: 2
    }
  end
end

