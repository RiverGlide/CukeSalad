$:.unshift(File.dirname(__FILE__) + '/../../lib') #where to find CukeSalad

require 'cukesalad'

After do
  FileUtils.rm_rf 'tmp'
end
