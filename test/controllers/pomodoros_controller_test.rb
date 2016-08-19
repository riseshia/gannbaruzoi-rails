# frozen_string_literal: true
require "test_helper"

class PomodorosControllerTest < ActionDispatch::IntegrationTest
  def user
    @user ||= create(:user)
  end

  def task
    @task ||= create(:task, user: user)
  end

  def setup
    sign_in user
  end

  def test_index
    create(:pomodoro, task: task)
    get pomodoros_url
    assert_response :success
  end

  def test_new
    get new_pomodoro_url
    assert_response :success
  end

  def test_create
    create(:pomodoro, task: task)
    assert_difference "Pomodoro.count", 1 do
      post pomodoros_url, params: { pomodoro: { task_id: task.id } }
    end

    assert_redirected_to pomodoro_path(Pomodoro.last)
  end

  def test_show
    pomodoro = create(:pomodoro, task: task)
    get pomodoro_url(pomodoro)
    assert_response :success
  end

  def test_show_pomodoro_with_the_other_user
    pomodoro = create(:pomodoro)
    get pomodoro_url(pomodoro)
    assert_redirected_to root_url
  end

  def test_destroy
    pomodoro = create(:pomodoro, task: task)
    assert_difference "Pomodoro.count", -1 do
      delete pomodoro_url(pomodoro)
    end

    assert_redirected_to pomodoros_url
  end

  def test_destroy_with_the_other_user
    pomodoro = create(:pomodoro)
    assert_no_difference "Task.count" do
      delete pomodoro_url(pomodoro)
    end

    assert_redirected_to root_url
  end
end

