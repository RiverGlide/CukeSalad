['create a task', 'created a task'].each do | create_a_new_task |
  in_order_to create_a_new_task, called: :name_of_task, containing: :code do
    file_name = the( :name_of_task ).gsub(" ", "_")
    
    default_content = 
      "in_order_to '#{the :name_of_task}' do
        #nothing 
      end" 
    content = the :code
    content = default_content if content.nil?

    write_file "features/lib/tasks/#{file_name}.rb", content
  end
end
