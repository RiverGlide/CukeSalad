[ 'interactively ran',
  'interactively running'].each do |interactively_run|
  in_order_to interactively_run, the_command: :command, answering: :answer do
    @aruba_timeout_seconds = 10
    run_interactive unescape( the :command )
    type "#{the :answer}\n"
  end
end
