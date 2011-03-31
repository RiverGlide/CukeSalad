#TODO: Consider exposing this detail in the examples since it shows you what to do
in_order_to "CreateARole" do
  write_file 'features/lib/roles/new_customer.rb', "module NewCustomer\nend"
end
