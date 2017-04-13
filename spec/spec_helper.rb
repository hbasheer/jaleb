require "factory_girl"
require "vcr"
require "bundler/setup"
require File.expand_path("../../lib/jaleb", __FILE__)
Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
