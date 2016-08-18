# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:id)
    sequence(:email) { |n| "email#{n}@email.com" }
    sequence(:name) { |n| "User#{n}" }
    password "userpwd"
    password_confirmation "userpwd"
    provider "github"
    sequence(:uid)
  end
end

