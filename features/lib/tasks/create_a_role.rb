#TODO: Consider exposing this detail in the examples since it shows you what to do
in_order_to 'create a role', called: :name_of_role do
  write_file 'features/lib/roles/my_role.rb', "module #{the :name_of_role}\nend"
end
