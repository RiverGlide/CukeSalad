class TaskWithSpecifics
  def initialize details
    @info = with_specifics_from( details )
  end
  
  def value_of(symbol)
    @info[symbol]
  end

  def with_specifics_from details
    result = {}
    names_and_values_in(details).each_slice(2) do |name_value| 
      result[symbolized name_value[0]] = the_value_from_the name_value[1]
    end
    result
  end

  def names_and_values_in details
    specifics_pattern = /('[^']+')/
    details.split(specifics_pattern)
  end

  def symbolized name
    name.strip.gsub(' ', '_').to_sym
  end

  def the_value_from_the item 
    item.gsub(/(^'|'$)/, '')
  end
end
