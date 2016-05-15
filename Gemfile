source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'puma'
gem 'rack-timeout'


group :development, :test do
  gem 'factory_girl_rails'
end

group :test do
  gem 'headless', require: false # Xvfb interface (for capybara-webkit)
  gem 'capybara'
  gem "capybara-webkit"
  gem "codeclimate-test-reporter", require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'rspec-rails', '~> 2.0'
  gem 'timecop'
end

gem 'rails_12factor', group: :production

# Asset gems
gem 'therubyracer' # needed for coffee-rails
gem 'sass-rails', '>= 4.0.2'
gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'uglifier', '>= 1.0.3'
gem 'jquery-rails'
gem 'underscore-rails'
gem 'react-rails', '~> 0.12.0.0'

gem 'cancan'
gem 'figaro'
gem 'geocoder'
gem "koala", "~> 1.10.0rc"
gem 'omniauth'
gem 'omniauth-facebook'
gem 'newrelic_rpm'
