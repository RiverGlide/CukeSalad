['create a file', 'created a file'].each do | create_a_new_file |
  in_order_to create_a_new_file, at: :path, containing: :content do
    write_file( the(:path), the(:content ))
  end
end
