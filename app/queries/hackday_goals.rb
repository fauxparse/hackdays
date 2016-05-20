class HackdayGoals
  def initialize(hackday)
    @hackday = hackday
  end

  def goals
    @hackday.goals.includes(:likes, :commitments => :user)
  end
end
