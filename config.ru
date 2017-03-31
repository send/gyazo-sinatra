# frozen_string_literal: true

require 'bundler'

Bundler.require

require File.join(__dir__, '/app.rb')

run Gyazo::Controller
