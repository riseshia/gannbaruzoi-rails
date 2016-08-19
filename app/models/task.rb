# frozen_string_literal: true

# Task
class Task < ApplicationRecord
  belongs_to :parent_task, optional: true
  belongs_to :user

  def self.init_with_user(params, user)
    task = new(params)
    task.user = user
    task
  end
end

