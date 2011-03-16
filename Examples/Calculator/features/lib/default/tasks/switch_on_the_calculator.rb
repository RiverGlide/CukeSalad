require 'rspec/expectations'

class SwitchOnTheCalculator
  include RSpec::Matchers
  
  def perform_as the_user
      the_user.should_not be_nil
      the_user.should respond_to :enters
      the_user.should respond_to :presses
      the_user.should respond_to :can_see
  end
end
