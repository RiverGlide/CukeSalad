$:.unshift(File.dirname(__FILE__) + '/../../lib')
$:.unshift(File.dirname(__FILE__) + '/../tasks')

require 'calculating_individual' #TODO: remove the need for require so that the Narrative_steps can come from a gem
require 'narrative_steps'
