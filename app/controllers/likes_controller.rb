class LikesController < ApplicationController
  def create
    LikeGoal.new(goal, current_user).call
    render_likes
  end

  def destroy
    LikeGoal.new(goal, current_user, false).call
    render_likes
  end

  private

  def goal
    @goal ||= Goal.find(params[:goal_id])
  end

  def render_likes
    render partial: "goals/likes", locals: { goal: goal }
  end
end
