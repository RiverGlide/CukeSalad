[ 'created a role',
  'creating a role'].each do | create_a_role |
  in_order_to create_a_role, named: :role_name do
    write_file 'features/lib/roles/my_role.rb', "module #{the :role_name}\nend"
  end
end
