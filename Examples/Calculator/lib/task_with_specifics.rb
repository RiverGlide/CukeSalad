$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'ostruct'
Bundler.setup

class TaskWithSpecifics
  def initialize detail
    @specifics = with_specifics_from( detail )
  end

  def with_specifics_from detail
    specifics_pattern = /('[^']+')/
    OpenStruct.new Hash[*detail.split(specifics_pattern).collect { |e| e.gsub('\'', '').strip.gsub(' ', '_') }]
  end

end

