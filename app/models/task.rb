# frozen_string_literal: true
class Task < ApplicationRecord
  belongs_to :parent_task, optional: true
  belongs_to :user
end

