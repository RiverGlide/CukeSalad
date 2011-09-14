require 'web_calculator'
require 'web_calculating_individual'
require 'capybara/dsl'

Capybara.app = WebCalculator
Capybara.default_driver = :selenium

module CalculatingIndividual

  include WebCalculatingIndividual
end
