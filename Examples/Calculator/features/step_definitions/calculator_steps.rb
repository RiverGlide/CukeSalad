$:.unshift(File.dirname(__FILE__) + '/../roles')
$:.unshift(File.dirname(__FILE__) + '/../tasks')
$:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad

require 'cuke_salad'
require 'calculating_individual' 
