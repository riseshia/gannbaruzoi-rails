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

  def test_add_log_returns_true
    task = create(:task)
    assert_difference "Pomodoro.count", 1 do
      pomodoro = task.add_log
      assert pomodoro.persisted?
      assert_equal task.id, pomodoro.task_id
    end
  end

  def test_add_log_returns_false
    task = build(:task)
    assert_no_difference "Pomodoro.count" do
      refute task.add_log.persisted?
    end
  end

  def test_done_returns_true
    task = build(:task, done_flg: true)
    assert task.done?
  end

  def test_done_returns_false
    task = build(:task, done_flg: false)
    refute task.done?
  end

  private

  def params
    {
      description: "Description",
      estimated_pomodoro: 2
    }
  end
end

