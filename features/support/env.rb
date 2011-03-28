$:.unshift(File.dirname(__FILE__) + '/../../lib') #where to find CukeSalad

require 'cuke_salad'

After do
  FileUtils.rm_rf 'tmp'
end
