class GetTheAnswer

  def perform_as the_user
    the_user.presses :equals
    the_user.can_see
  end
end
