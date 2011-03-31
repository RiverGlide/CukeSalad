in_order_to "RunAScenario", containing: :step do
  write_file 'features/a.feature', "Feature: A Feature

  Scenario: A Scenario
    #{the :step}"
  run_simple unescape( 'cucumber features/a.feature' ), false
end
