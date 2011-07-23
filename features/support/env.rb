require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber/rails'

  require 'capybara/rails'
  require 'capybara/cucumber'
  require 'capybara/session'

  ActionController::Base.allow_rescue = false

  Capybara.default_selector = :css
  Cucumber::Rails::World.use_transactional_fixtures = true

  ActiveSupport::Dependencies.clear
end

Spork.each_run do  
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  FactoryGirl.factories.clear
  Dir[Rails.root.join("spec/factories.rb")].each {|f| load f}

  VarnaLab::Application.reload_routes!
  I18n.reload!
end