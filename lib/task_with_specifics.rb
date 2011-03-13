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
    names_and_values.collect { |e|
      item = e.strip
      if is_a_name? item
        replace_spaces_with_underscores_in(item).to_sym
      elsif is_a_value? item 
        remove_surrounding_quotes_from(item)
      end
    }
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

  def names_and_values_in details
    specifics_pattern = /('[^']+')/
    details.split(specifics_pattern)
  end
end

