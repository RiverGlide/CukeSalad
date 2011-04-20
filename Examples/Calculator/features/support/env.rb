$:.unshift(File.dirname(__FILE__) + '/../../lib') #where to find the calculator implementation

require 'cukesalad'

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
