class TaskWithSpecifics
  def initialize details
    @info = with_specifics_from( details )
  end
  
  def value_of(symbol)
    @info[symbol]
  end

  def with_specifics_from details
    Hash[*name_value_pairs_from(names_and_values_in(details))]
  end

  def name_value_pairs_from names_and_values
    names_and_values.collect { |e| give_me_a_something e.strip }
  end

  def give_me_a_something item
    return replace_spaces_with_underscores_in(item).to_sym if is_a_name? item
    return remove_surrounding_quotes_from(item) if is_a_value? item
    raise "How did we get here?"
  end
 
  def names_and_values_in details
    specifics_pattern = /('[^']+')/
    details.split(specifics_pattern)
  end

  def replace_spaces_with_underscores_in item
    item.gsub(' ', '_')
  end

  def remove_surrounding_quotes_from item 
    item.gsub(/(^'|'$)/, '')
  end

  def is_a_name? item
    item =~ /^[^'].*[^']$/
  end
  
  def is_a_value? item
    item =~ /^'.*'$/ 
  end
end
