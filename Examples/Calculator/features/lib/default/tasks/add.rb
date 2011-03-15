class Add < TaskWithSpecifics

  def perform_as the_user
    the_user.enters value_of(:the_number)
    the_user.presses :plus
    the_user.enters value_of(:to_the_number)
  end
end
