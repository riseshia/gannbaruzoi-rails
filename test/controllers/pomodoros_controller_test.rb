# frozen_string_literal: true
require "test_helper"

class PomodorosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    sign_in @user
  end

  def test_index
    get pomodoros_url
    assert_response :success
  end

  def test_new
    get new_pomodoro_url
    assert_response :success
  end

  def test_create
    task = create(:task)

    assert_difference "Pomodoro.count", 1 do
      post pomodoros_url, params: { pomodoro: { task_id: task.id } }
    end

    assert_redirected_to pomodoro_path(Pomodoro.last)
  end

  def test_show
    pomodoro = create(:pomodoro)
    get pomodoro_url(pomodoro)
    assert_response :success
  end

  def test_edit
    pomodoro = create(:pomodoro)
    get edit_pomodoro_url(pomodoro)
    assert_response :success
  end

  def test_update
    pomodoro = create(:pomodoro)
    task = create(:task)

    patch pomodoro_url(pomodoro),
          params: { pomodoro: { task_id: task.id } }
    assert_redirected_to pomodoro_path(pomodoro)
  end

  def test_destroy
    pomodoro = create(:pomodoro)
    assert_difference "Pomodoro.count", -1 do
      delete pomodoro_url(pomodoro)
    end

    assert_redirected_to pomodoros_path
  end
end

