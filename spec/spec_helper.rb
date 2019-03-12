
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require "capybara"
require "rspec"
require_relative "./setup_test_helper"
require_relative 'db_helper.rb'
require_relative "../app.rb"

ENV["ENVIRONMENT"] = "test"

ActiveRecord::Base.establish_connection(ENV['SLEEPERS_TEST_DB_URL'])

Capybara.app = SleeperManager

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
    empty_database
  end
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.


  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
