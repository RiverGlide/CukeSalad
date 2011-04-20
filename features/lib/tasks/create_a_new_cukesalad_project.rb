#TOOO: consider doing this as a feature since it's part of how you set up the project.
in_order_to "CreateANewCukeSaladProject" do
  create_dir 'features'
  create_dir 'features/support'
  write_file 'features/support/env.rb', "$:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad
             
             require 'cukesalad'"
  create_dir 'features/lib'
  create_dir 'features/lib/roles'
  create_dir 'features/lib/tasks'
end
