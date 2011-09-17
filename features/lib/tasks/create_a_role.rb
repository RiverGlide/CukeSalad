in_order_to 'have created a role', named: :role_name do
  write_file 'features/lib/roles/my_role.rb', "module #{the :role_name}\nend"
end
