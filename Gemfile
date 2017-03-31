# frozen_string_literal: true

source 'https://rubygems.org'

gem 'sinatra'
gem 'puma'

group :development do
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'pry'
end

group :development, :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'rubocop', require: false
  gem 'simplecov'
  gem 'travis'
end
