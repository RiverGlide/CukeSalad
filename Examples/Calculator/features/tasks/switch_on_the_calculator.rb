require 'rubygems'
require 'rspec/expectations'

class SwitchOnTheCalculator 
  include RSpec::Matchers
  
  def initialize with_nothing
  end
  
  def perform_as calculator
      calculator.should_not be_nil
  end
end