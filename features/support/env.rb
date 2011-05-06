require 'cukesalad'

After do
  FileUtils.rm_rf 'tmp'
end
