class HackdayGoals
  def initialize(hackday)
    @hackday = hackday
  end

  def goals
    @hackday.goals.includes(:commitments => :user)
  end
end
