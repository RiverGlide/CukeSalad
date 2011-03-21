# To run with this version of the Calculating Individual:
# cucumber --profile alternative 

require 'web_calculator'
require 'capybara'
require 'capybara/dsl'

Capybara.app = WebCalculator
Capybara.default_driver = :rack_test

module CalculatingIndividual

  # Uses a Browser to perform its tasks
  include Capybara
  # This is not a page object. It is a WebUser, specialised to our application
  # See the comments in the 'enter' and 'press' method for an explanation of why

  def switch_on_the_calculator
    visit '/'
  end

  def enter value
    fill_in 'number', :with => value
    # Because the calculator is a simple web_app with only
    # one page we can put the id for the field here. In a more complex web-app
    # we would pass in the id of the thing to enter
    # The task would express the action as: enter( :the_number, "10")
    # Because we can change the id used in our application,
    # we would just change the id in the application to be 'the_number'.
    # If we were on a project where we could not change the id 
    # in the application we would write an 'ApplicationExpert' 
    # to map :the_number to the id for the field 'number'. Our CalculatingIndividual
    # would ask the ApplicationExpert for the id of the symbol :the_number
    # See 'press' below for am explanation of how an ApplicationExpert 
    # would work 
  end
  
  def press operator
    click_button operator.to_s
    # Here, our 'operator' happens to also match the id for the button.
    # If we were on a project where we could not choose what the id
    # was for buttons, we would write an ApplicationExpert to map 
    # the symbol used in the task to the symbol for that button. 
    # The ApplicationExpert would only need to know what page it 
    # was on to find a mappings class (or yml file) for the fields on that page.
  end

  def look_at_the_display
    find_field('display').value.to_i
  end

  def is_the_calculator_ready?
    page.body.should =~ /Calculator is Ready!/
  end
end
