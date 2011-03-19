require 'rspec/expectations'

module SwitchOnTheCalculator
  include RSpec::Matchers
  
  def follow_instructions 
     @calc = switch_on_the_calculator
     self.should respond_to :enter
     self.should respond_to :press
     self.should respond_to :check_the_display
  end
end
