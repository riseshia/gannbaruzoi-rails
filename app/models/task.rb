# frozen_string_literal: true

# Task
class Task < ApplicationRecord
  belongs_to :parent_task, optional: true, class_name: "Task"
  belongs_to :user
  has_many :pomodoros

  delegate :description, to: :parent_task, prefix: true

  def self.init_with_user(params, user)
    task = new(params)
    task.user = user
    task
  end

  def add_log
    Pomodoro.create(task_id: id)
  end

  def done?
    done_flg
  end

  def subtask?
    parent_task_id?
  end
end

