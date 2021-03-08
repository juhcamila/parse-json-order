ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  class << self
    alias :context :describe
  end
end
