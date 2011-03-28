in_order_to "RunAScenario" do
  create_dir('features')
  create_dir('features/support')
  write_file('features/support/env.rb', "$:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad
             
             require 'cuke_salad'")
  write_file('features/a_feature.feature', "Feature: A Feature

  Scenario: A Scenario
    #{value_of(:containing)}")
  run_simple(unescape('cucumber features/a_feature.feature'), false)
end
