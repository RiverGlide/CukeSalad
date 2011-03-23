in_order_to "SwitchOnTheCalculator" do
  require 'rspec/expectations'
  extend RSpec::Matchers
  
  @calc = switch_on_the_calculator
  self.should respond_to :enter
  self.should respond_to :press
  self.should respond_to :look_at_the_display
end
