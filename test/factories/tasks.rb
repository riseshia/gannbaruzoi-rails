# frozen_string_literal: true
FactoryGirl.define do
  factory :task do
    sequence(:id)
    sequence(:description) { |n| "Description#{n}" }
    estimated_pomodoro 3
    done_flg false
    association :user
  end
end

