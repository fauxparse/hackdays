class LikeGoal
  def initialize(goal, user, likes = true)
    @goal = goal
    @user = user
    @likes = likes
  end

  def call
    if @likes
      like.save if like.new_record?
    else
      like.destroy if like.persisted?
    end
  end

  private

  def like
    @like ||= @goal.likes.find_or_initialize_by(user_id: @user.id)
  end
end
