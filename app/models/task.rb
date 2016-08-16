# frozen_string_literal: true
class Task < ApplicationRecord
  belongs_to :parent_task
  belongs_to :user
end

