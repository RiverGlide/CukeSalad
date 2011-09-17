in_order_to 'run a scenario', containing: :steps do
  write_file 'features/a.feature', "Feature: A Feature

  Scenario: A Scenario
    #{the :steps}"
  run_simple unescape( 'cucumber features/a.feature' ), false
end
