# To run with this version of the Calculating Individual:
# cucumber --profile alternative 

require 'web_calculator'
require 'capybara'
require 'capybara/dsl'

Capybara.app = WebCalculator
Capybara.default_driver = :rack_test

module CalculatingIndividual

  include Capybara

  def role_preparation
    switch_on_the_calculator
  end

  def switch_on_the_calculator
    visit '/'
  end

  def enter value
    fill_in 'number', :with => value
  end
  
  def press operator
    click_button operator.to_s
  end

  def look_at_the_display
    find_field('display').value.to_i
  end

  def is_the_calculator_ready?
    page.body.should =~ /Calculator is Ready!/
  end
end
