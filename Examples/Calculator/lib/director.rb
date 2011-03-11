$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'researcher'
Bundler.setup

class Director

  def initialize researcher=Researcher.new
    @researcher = researcher
  end

  def how_do_i_perform this_thing, *with_details
    @researcher.get_directives_for( this_thing ).new( *with_specifics_from( with_details ))
  end
  
  def with_specifics_from details
    specifics_pattern = /('[^']+')/
    details.collect do | detail |
      OpenStruct.new Hash[*detail.split(specifics_pattern).collect { |e| e.gsub('\'', '').strip.gsub(' ', '_') }]
    end
  end
  
end
