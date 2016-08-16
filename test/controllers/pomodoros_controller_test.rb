# frozen_string_literal: true
require "test_helper"

class PomodorosControllerTest < ActionDispatch::IntegrationTest
  def pomodoro
    @pomodoro ||= pomodoros :one
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
    assert_difference "Pomodoro.count" do
      post pomodoros_url, params: { pomodoro: { task_id: pomodoro.task_id } }
    end

    assert_redirected_to pomodoro_path(Pomodoro.last)
  end

  def test_show
    get pomodoro_url(pomodoro)
    assert_response :success
  end

  def test_edit
    get edit_pomodoro_url(pomodoro)
    assert_response :success
  end

  def test_update
    patch pomodoro_url(pomodoro), params: { pomodoro: { task_id: pomodoro.task_id } }
    assert_redirected_to pomodoro_path(pomodoro)
  end

  def test_destroy
    assert_difference "Pomodoro.count", -1 do
      delete pomodoro_url(pomodoro)
    end

    assert_redirected_to pomodoros_path
  end
end

