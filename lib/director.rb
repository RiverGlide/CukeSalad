$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'researcher'
Bundler.setup

class Director

  def initialize
    @researcher = Researcher.new
  end

  def how_do_i_perform this_thing
    @researcher.get_directives_for( this_thing )
  end
end
