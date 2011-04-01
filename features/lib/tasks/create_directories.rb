in_order_to "CreateDirectories", as_follows: :several_directories do
  the( :several_directories ).split( " " ).each do | path |
    create_dir path
  end
end
