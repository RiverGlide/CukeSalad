$:.unshift(File.dirname(__FILE__) + '/../features/roles')
$:.unshift(File.dirname(__FILE__) + '/../features/tasks')
$:.unshift(File.dirname(__FILE__) + '/../../../lib') #where to find CukeSalad

require 'cuke_salad'
