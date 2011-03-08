require 'rubygems'
require 'rspec/expectations'

class SwitchOnTheCalculator 
  include RSpec::Matchers
  
  def initialize with_nothing
  end
  
  def perform_as calculating_individual
      calculating_individual.should_not be_nil
  end
end