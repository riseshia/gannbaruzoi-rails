# frozen_string_literal: true
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:pomodoros)
  should have_many(:subtasks).source(:tasks)
    .with_foreign_key(:parent_task_id).class_name("Task")

  def test_valid
    task = build(:task)
    assert task.valid?
  end

  def test_main_task_of_returns_correct_tasks
    user = create(:user)
    tasks = [create(:task, user_id: user.id, done_flg: true),
             create(:task, user_id: user.id)]
    create(:task, user_id: user.id, parent_task: tasks.first)

    actual = Task.main_task_of(user.id)
    assert_equal tasks.reverse, actual
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

  def test_subtask_returns_true
    parent_task = create(:task)
    task = build(:task, parent_task: parent_task)
    assert task.subtask?
  end

  def test_subtask_returns_false
    task = build(:task)
    refute task.subtask?
  end

  private

  def params
    {
      description: "Description",
      estimated_pomodoro: 2
    }
  end
end

