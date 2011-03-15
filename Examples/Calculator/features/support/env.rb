$:.unshift(File.dirname(__FILE__) + '/../lib/roles')
$:.unshift(File.dirname(__FILE__) + '/../lib/tasks')
$:.unshift(File.dirname(__FILE__) + '/../../lib') #where to find the calculator implementation
$:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad

require 'cuke_salad'

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
