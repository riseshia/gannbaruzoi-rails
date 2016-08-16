# frozen_string_literal: true
require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  def test_index
    get tasks_url
    assert_response :success
  end

  def test_new
    get new_task_url
    assert_response :success
  end

  def test_create
    user = create(:user)
    assert_difference "Task.count", 1 do
      post tasks_url, params: { task: attributes_for(:task, user_id: user.id) }
    end

    assert_redirected_to task_path(Task.last)
  end

  def test_show
    task = create(:task)
    get task_url(task)
    assert_response :success
  end

  def test_edit
    task = create(:task)
    get edit_task_url(task)
    assert_response :success
  end

  def test_update
    task = create(:task)
    patch task_url(task),
          params: { task: { done_flg: "true" } }
    assert_redirected_to task_path(task)
  end

  def test_destroy
    task = create(:task)
    assert_difference "Task.count", -1 do
      delete task_url(task)
    end

    assert_redirected_to tasks_path
  end
end

