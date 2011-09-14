require 'capybara/dsl'
module WebCalculatingIndividual

  include Capybara::DSL

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
