#TODO: Consider exposing this detail in the examples since it shows you what to do
in_order_to 'create a task', called: :name_of_task do
  write_file 'features/lib/tasks/some_task.rb', "in_order_to '#{the :name_of_task}' do\nend"
end
