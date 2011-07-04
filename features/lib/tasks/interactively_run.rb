in_order_to "interactively run", the_command: :command, and_type: :answer do
  @aruba_timeout_seconds = 10
  run_interactive unescape( the :command )
  type "#{the :answer}\n"
end
