require 'rubygems'
require 'bundler'
Bundler.setup

$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'actor'
require 'director'
require 'researcher'
require 'task_with_specifics'
