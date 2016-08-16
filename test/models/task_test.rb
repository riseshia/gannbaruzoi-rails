# frozen_string_literal: true
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def test_valid
    task = build(:task)
    assert task.valid?
  end
end

