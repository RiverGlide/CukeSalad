$:.unshift(File.dirname(__FILE__) + '/../lib/')
require 'web_calculator'
require 'capybara'
require 'capybara/dsl'

Capybara.app = WebCalculator
Capybara.default_driver = :rack_test

describe "WebCalculator", :type => :request do

  include Capybara

  context "homepage" do
    it "is successful" do
      visit '/'
      page.should have_content 'Calculator is Ready!'
    end
  end

  def calculator_display
    find_field('display').value.to_i
  end

  context "storing calculator display state" do
    it "starts with nothing" do
      visit '/'
      calculator_display.should == 0
    end

    it "udpates the display when an operator is pressed" do
      visit '/'
      fill_in 'display', :with => '10'
      click_button 'minus'
      calculator_display.should == 10
    end

    it "updates the display when a different different operator is pressed" do
      visit '/'
      fill_in 'display', :with => '15'
      click_button 'plus'
      calculator_display.should == 15
    end

    it "persists the display between requests" do
      visit '/'
      fill_in 'display', :with => '15'
      click_button 'plus'
      visit '/'
      calculator_display.should == 15
    end
  end

  context "doing simple arithmetic" do
    it "adds two numbers" do
      visit '/'
      fill_in 'display', :with => '1'
      click_button 'plus'
      fill_in 'display', :with => '0'
      click_button 'equals'
      calculator_display.should == 1
    end
  end
end
