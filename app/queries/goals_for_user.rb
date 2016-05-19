class GoalsForUser
  def initialize(user)
    @user = user
  end

  def goals
    @goals = Goal.includes(:commitments => :hackday)
      .where("commitments.user_id = ?", @user.id)
      .order("hackdays.start_date DESC")
  end
end
