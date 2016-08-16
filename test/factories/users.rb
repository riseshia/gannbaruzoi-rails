# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:id)
    sequence(:email) { |n| "email#{n}@email.com" }
    password "userpwd"
    password_confirmation "userpwd"
  end
end

