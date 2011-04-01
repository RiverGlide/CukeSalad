in_order_to "SeeItHas" do
  outcome = {1 => "failed", 0 => "passed"}
  outcome[@last_exit_status]
end
