module LikesHelper
  def liked?(goal)
    goal.likes.any? { |like| like.user_id == current_user.id }
  end
end
