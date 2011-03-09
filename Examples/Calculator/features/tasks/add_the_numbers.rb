class AddTheNumbers
  def initialize from_list
    @from_list = from_list
  end
  
  def perform_as calculating_individual
    @from_list.each do |value|
      calculating_individual.enter value.to_f
      calculating_individual.plus
    end
  end
end

