class AddTheNumbers
  def initialize from_list
    @from_list = from_list
  end
  
  def perform_as calculator
    @from_list.each do |value|
      calculator.enter value.to_f
      calculator.plus
    end
  end
end