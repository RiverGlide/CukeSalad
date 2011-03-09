class Add
  def initialize information
    @information = information
  end

  def perform_as calculating_individual
    calculating_individual.enter @information.the_numbers.to_f
    calculating_individual.plus
    calculating_individual.enter @information.and.to_f
    calculating_individual.plus
  end
end
