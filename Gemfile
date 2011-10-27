source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'sqlite3'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

#gem 'compass', :git => 'https://github.com/chriseppstein/compass.git', :branch => 'stable'
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

group :development, :test do
  gem 'active_reload'
  gem 'jasmine'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'minitest'
  gem 'launchy'
  gem 'shoulda-matchers'
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
