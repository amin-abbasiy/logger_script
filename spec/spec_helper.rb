require 'simplecov'
SimpleCov.start
require 'bundler/setup'
require 'logger_script'
require 'factory_bot'
require_relative '../config'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
