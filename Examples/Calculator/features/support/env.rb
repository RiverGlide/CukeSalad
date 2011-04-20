$:.unshift(File.dirname(__FILE__) + '/../../lib') #where to find the calculator implementation
$:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad

require 'cukesalad'

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
