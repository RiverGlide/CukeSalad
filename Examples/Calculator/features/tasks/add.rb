class Add < TaskWithSpecifics

  def perform_as calculating_individual
    calculating_individual.enter value_of(:the_number).to_i
    calculating_individual.press :plus
    calculating_individual.enter value_of(:to_the_number).to_i
    calculating_individual.press :plus
  end
end
