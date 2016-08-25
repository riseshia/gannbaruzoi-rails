# frozen_string_literal: true
ENV["RAILS_ENV"] = "test"
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in
    # alphabetical order.
    include FactoryGirl::Syntax::Methods
    include Devise::Test::IntegrationHelpers
    # Add more helper methods to be used by all tests here...

    def teardown
      DatabaseRewinder.clean
    end
  end
end

