source 'http://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem "thin", "1.3.1"
gem "eventmachine", "1.0.0.beta.2"
gem "rake", "0.9.2.2"

gem 'bcrypt-ruby', :require => 'bcrypt'


gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "compass-rails"
  gem 'zurb-foundation', '~> 3.2.5'
  gem 'uglifier', '>= 1.0.3'
  gem "html5-boilerplate"
end

gem 'jquery-rails'

gem "haml"

gem 'imdb'

group :production do
  gem 'net-ldap'
end

gem 'ajaxful_rating', :git => 'git://github.com/edgarjs/ajaxful-rating.git', :branch => "rails3"


# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'nifty-generators'
  gem "ZenTest", "~> 4.4.2"
  gem "autotest-rails", "~> 4.1.0"
end

group :test, :development do
  gem 'sqlite3'
end

group :test do
  gem 'mocha'
  # Pretty printed test output
  gem 'turn', '0.8.3', :require => false
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'rspec-rails'
end

gem 'capistrano'
