$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'ostruct'
Bundler.setup

class TaskWithSpecifics
  def initialize details
    @specifics = *specifics_from( details )
  end

  def specifics_from details
    details.collect do | detail |
      OpenStruct.new Hash[*content_of( alternating_name_value_pairs_from( detail )) ]
    end
  end

  def content_of values
    values.collect { |value| value.gsub('\'', '').strip.gsub(' ', '_') }
  end

  def alternating_name_value_pairs_from detail
    specifics_pattern = /('[^']+')/
    detail.split( specifics_pattern)
  end

end

