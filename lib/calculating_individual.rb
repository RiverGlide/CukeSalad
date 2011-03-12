class CalculatingIndividual
  # This class represents the type of user of your application
  # This example also contains the implementation
  #  but obviously, this wouldn't normally be the case.
  
  attr_reader :display
  
  def initialize
    @display = 0
    @result = 0
  end
  
  def enter value
    @display = value
  end
  
  def plus
    @result = @result + @display
    @display = @result
  end
end
