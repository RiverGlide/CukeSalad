in_order_to "see it has" do
  outcome = {1 => "failed", 0 => "passed"}
  return 'pending' if all_output.include? 'pending'
  outcome[@last_exit_status]
end
