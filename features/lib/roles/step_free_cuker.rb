require 'aruba/api'
#TODO: Consider wrapping Aruba 
module StepFreeCuker
  include Aruba::Api

  def role_preparation
    create_a_new_cuke_salad_project
  end

  def create_a_new_cuke_salad_project
    create_dir 'features'
    create_dir 'features/support'
    write_file 'features/support/env.rb', "$:.unshift(File.dirname(__FILE__) + '/../../../../lib') #where to find CukeSalad
               
               require 'cukesalad'"
    create_dir 'features/lib'
    create_dir 'features/lib/roles'
    create_dir 'features/lib/tasks'
  end
end
