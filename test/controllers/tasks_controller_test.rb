# frozen_string_literal: true
require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def task
    @task ||= tasks :one
  end

  def test_index
    get tasks_url
    assert_response :success
  end

  def test_new
    get new_task_url
    assert_response :success
  end

  def test_create
    assert_difference "Task.count" do
      post tasks_url, params: { task: { description: task.description, done_flg: task.done_flg, estimated_pomodoro: task.estimated_pomodoro, parent_task_id: task.parent_task_id, user_id: task.user_id } }
    end

    assert_redirected_to task_path(Task.last)
  end

  def test_show
    get task_url(task)
    assert_response :success
  end

  def test_edit
    get edit_task_url(task)
    assert_response :success
  end

  def test_update
    patch task_url(task), params: { task: { description: task.description, done_flg: task.done_flg, estimated_pomodoro: task.estimated_pomodoro, parent_task_id: task.parent_task_id, user_id: task.user_id } }
    assert_redirected_to task_path(task)
  end

  def test_destroy
    assert_difference "Task.count", -1 do
      delete task_url(task)
    end

    assert_redirected_to tasks_path
  end
end

