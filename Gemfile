# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
group :default do
  # Official AWS Ruby gem for Amazon Simple Storage Service (Amazon S3).
  gem 'aws-sdk-s3', '~> 1.23.1', require: false
  # The authorization Gem for Ruby on Rails.
  gem 'cancancan'
  # gem for users
  gem 'devise'
  # Translations for the devise gem
  gem 'devise-i18n', '~>1.6.4'
  # Facebook OAuth2 Strategy for OmniAuth
  gem 'omniauth-facebook'
  # Use postgresql as the database for Active Record
  gem 'pg', '>= 0.18', '< 2.0'
  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'rails', '~> 6.0.0.rc1'
  # Use Puma as the app server
  gem 'puma', '~> 3.11'
  # A set of common locale data and translations to internationalize
  # and/or localize your Rails applications.
  gem 'rails-i18n', '~> 6.0.0.beta1'
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 5'
  # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
  gem 'webpacker', '~> 4.0'
  # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.5'
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 4.0'
  # Use Active Model has_secure_password
  # gem 'bcrypt', '~> 3.1.7'

  # Use Active Storage variant
  gem 'image_processing', '~> 1.2'
  # Reduces boot times through caching; required in config/boot.rb
  gem 'bootsnap', '>= 1.4.2', require: false
end

group :development, :test do
  # Brakeman detects security vulnerabilities in Ruby on Rails
  # applications via static analysis.
  gem 'brakeman', '~> 4.3.1', require: false
  # bundler-audit provides patch-level verification for Bundled apps.
  gem 'bundler-audit', '~> 0.6.0', require: false
  # Call 'byebug' anywhere to stop execution and get a debugger console
  gem 'byebug', '~> 10.0.1', platforms: %i[mri mingw x64_mingw]
  # Provides a framework and DSL for defining and using factories - less
  # error-prone, more explicit, and all-around easier to work with than fixtures
  gem 'factory_bot_rails', '~> 4.10.0'
  # Flay analyzes code for structural similarities. Differences in literal
  # values, variable, class, method names, whitespace, programming style,
  # braces vs do/end, etc are all ignored.
  gem 'flay', '~> 2.12.0', require: false
  # Extracting `assigns` and `assert_template` from ActionDispatch.
  gem 'rails-controller-testing', '~> 1.0.2'
  # Reek is a tool that examines Ruby classes, modules and
  # methods and reports any code smells it finds.
  gem 'reek', '~> 4.8.0', require: false
  # rspec-rails is a testing framework for Rails 3+.
  gem 'rspec-rails', git: 'https://github.com/rspec/rspec-rails.git',
                     branch: '4-0-dev'
  # Automatic Ruby code style checking tool. Aims to enforce
  # the community-driven Ruby Style Guide.
  gem 'rubocop', '~> 0.57.2', require: false
end

group :development do
  # Annotates Rails/ActiveRecord Models, routes, fixtures,
  # and others based on the database schema.
  gem 'annotate', '~> 2.7.4'
  # Great Ruby dubugging companion: pretty print Ruby objects to
  # visualize their structure.
  gem 'awesome_print', '~> 1.8.0', require: 'ap'
  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # RSpec results that Hudson can read.
  gem 'rspec_junit_formatter', '0.4.1'
  # Code coverage for Ruby 1.9+ with a powerful configuration library
  gem 'simplecov', '~> 0.16.1', require: false
  # WebMock allows stubbing HTTP requests and setting expectations on HTTP requests.
  gem 'webmock', '~> 3.4.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
