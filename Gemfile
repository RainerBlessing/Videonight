source 'http://rubygems.org'

gem 'rails', '3.2.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'


gem 'sass-rails',   '~> 3.2.3'
gem 'compass'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
  gem "html5-boilerplate"
end

gem 'jquery-rails'

gem "haml"

gem 'imdb'

gem 'net-ldap'

gem 'ajaxful_rating', :git => 'git://github.com/edgarjs/ajaxful-rating.git', :branch => "rails3"

gem 'thin'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'nifty-generators'
end

group :test, :development do
  gem 'mocha'
  gem 'sqlite3'
end

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'cucumber-rails'
  gem 'database_cleaner'
end
gem "mocha", :group => :test
