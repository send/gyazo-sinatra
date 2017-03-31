# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
require 'bundler'
Bundler.require

require 'rack/test'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec'
end

require_relative '../app.rb'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
