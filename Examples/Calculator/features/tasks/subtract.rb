class Subtract < TaskWithSpecifics

  def perform_as the_user
    the_user.enters value_of( :from_the_number)
    the_user.presses :-
    the_user.enters value_of( :the_number )
  end
end
