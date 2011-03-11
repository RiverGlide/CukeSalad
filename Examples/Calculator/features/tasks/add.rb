require 'task_with_specifics'
class Add < TaskWithSpecifics

  def perform_as calculating_individual
    calculating_individual.enter @specifics.the_numbers.to_f
    calculating_individual.plus
    calculating_individual.enter @specifics.and.to_f
    calculating_individual.plus
  end
end
