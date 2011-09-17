in_order_to "switch on the calculator" do
  require 'rspec/expectations'
  extend RSpec::Matchers
  
  switch_on_the_calculator
  self.should respond_to :enter
  self.should respond_to :press
  self.should respond_to :look_at_the_display
end
