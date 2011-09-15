module CalculatorOperations
  OPS = { 'plus' => '+', 'minus' => '-', 'equals' => '=' }
  OPERATORS = OPS.invert 
  OPERATIONS = { 'plus' => :+, 'minus' => :-, 'equals' => '=' }
end
