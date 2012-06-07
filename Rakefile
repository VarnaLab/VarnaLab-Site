require File.expand_path('../config/application', __FILE__)

VarnaLab::Application.load_tasks

desc "Generates a dummy app for testing"
task :test_app do
  puts "Setting up dummy database..."
  cmd = "bundle exec rake db:drop db:create db:migrate db:test:prepare"

  if RUBY_PLATFORM =~ /mswin/ #windows
    cmd += " >nul"
  else
    cmd += " >/dev/null"
  end

  system(cmd)
end