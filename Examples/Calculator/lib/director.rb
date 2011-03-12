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
    @researcher.get_directives_for( this_thing ).new *with_details #( *with_specifics_from( with_details ))
  end
end
