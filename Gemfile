source 'http://rubygems.org'

gem 'rails', '3.2.0'

gem 'sqlite3'

gem 'sass-rails', '~> 3.2.3'
gem 'coffee-rails', '~> 3.2.1'
gem 'uglifier'

gem 'compass', :git => 'https://github.com/armstrjare/compass.git', :branch => 'fix_sprockets_static_asset_error'

gem 'therubyracer'
gem 'slim'

gem 'appconfig'

gem 'jquery-rails'

gem 'simple_form'
gem 'inherited_resources'
gem 'kaminari'
gem 'awesome_nested_set', :git => 'git://github.com/collectiveidea/awesome_nested_set.git'

gem 'spork', '~> 0.9.0.rc9'
gem 'ruby-debug19', :require => 'ruby-debug'
gem 'devise'


group :development, :test do
  gem 'jasmine'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'guard'
  gem 'guard-rspec', '~> 0.6.0'
  gem 'guard-bundler'
  gem 'guard-cucumber'
end

group :test do
  gem 'minitest'
  gem 'launchy'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'webrat'
  gem 'turn', :require => false
end

if RUBY_VERSION < '1.9'
  gem 'ruby-debug'
else
  gem 'ruby-debug19'
end
