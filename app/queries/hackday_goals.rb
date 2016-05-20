class HackdayGoals
  def initialize(hackday)
    @hackday = hackday
  end

  def goals
    @hackday.goals.includes(:project, :users, :likes)
  end
end
