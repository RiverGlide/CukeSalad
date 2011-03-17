# To run with this version of the Calculating Individual:
# cucumber --profile alternative 
# TODO: Move this stuff to the readme

require 'web_calculator'
require 'capybara'
require 'capybara/dsl'

Capybara.app = WebCalculator
Capybara.default_driver = :rack_test

class CalculatingIndividual

  # Uses a Browser to perform its tasks
  include Capybara

  def initialize 
    visit '/'
  end

  def enters value
    fill_in 'number', :with => value
  end
  
  def presses operator
    click_button operator.to_s
  end

  def can_see 
    find_field('display').value.to_i
  end

  def is_the_calculator_ready?
    page.body.should =~ /Calculator is Ready!/
  end
end
