require 'rubygems'
require 'sinatra'
require File.expand_path(File.dirname(__FILE__)) + '/app.rb'

run Gyazo::Controller
