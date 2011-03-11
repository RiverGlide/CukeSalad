$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'ostruct'
Bundler.setup

class TaskWithSpecifics
  def initialize details
    @specifics = *with_specifics_from( details )
  end

  def with_specifics_from details
    specifics_pattern = /('[^']+')/
    details.collect do | detail |
      OpenStruct.new Hash[*detail.split(specifics_pattern).collect { |e| e.gsub('\'', '').strip.gsub(' ', '_') }]
    end
  end

end

