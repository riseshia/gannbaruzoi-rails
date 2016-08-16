# frozen_string_literal: true
FactoryGirl.define do
  factory :pomodoro do
    association :task
  end
end

