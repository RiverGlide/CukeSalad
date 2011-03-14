require 'rspec/expectations'

class SwitchOnTheCalculator
  include RSpec::Matchers
  
  def perform_as calculating_individual
      calculating_individual.should_not be_nil
      calculating_individual.should respond_to :enters
      calculating_individual.should respond_to :presses
      calculating_individual.should respond_to :can_see
  end
end
