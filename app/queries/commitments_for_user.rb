class CommitmentsForUser
  def initialize(user, hackday = nil)
    @user = user
    @hackday = hackday
  end

  def commitments
    commitment_scope
      .includes(:goal => :project)
      .where(user: @user)
  end

  private

  def commitment_scope
    if @hackday.present?
      @hackday.commitments
    else
      Commitment
    end
  end
end
