require 'rubygems'
require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'rspec/autorun'
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end



  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, js: true) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end


    config.mock_with :rspec
    config.infer_base_class_for_anonymous_controllers = false
    config.include FactoryGirl::Syntax::Methods

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    config.include(MailerMacros)
    config.before(:each) { reset_email }
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
  require 'shoulda/matchers/integrations/rspec' # after require 'rspec/rails'
  I18n.backend.reload!
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end
end