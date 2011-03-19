require 'rspec/expectations'

module SwitchOnTheCalculator
  include RSpec::Matchers
  
  def follow_instructions 
     @calc = switch_on_the_calculator
     self.should respond_to :enters
     self.should respond_to :presses
     self.should respond_to :can_see
  end
end
