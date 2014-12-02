source 'https://rubygems.org'

ruby '2.1.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Newrelic monitoring
gem 'newrelic_rpm'

# Can Can for Authorization
gem 'cancan'

# Omniauth-Bnet for Authentication
gem 'omniauth-bnet'

group :development, :test do
  # Use Thin for development
  gem 'thin'

  # Use Capistrano for deployment
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'

  gem 'simplecov', require: false
  gem "codeclimate-test-reporter", require: false

  # Database Cleaning
  gem 'database_cleaner'

  # Mocking Net Requests
  gem 'webmock'
  gem 'vcr'

  # Factories
  gem 'factory_girl_rails'

  # Guard
  gem 'guard-rspec', require: false
  gem 'rb-readline'
end