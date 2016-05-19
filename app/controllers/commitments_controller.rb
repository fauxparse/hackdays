class CommitmentsController < ApplicationController
  def create
    goal.commitments.create(user: current_user)
    redirect_to goal.hackday
  end

  def destroy
    commitment.destroy
    redirect_to goal.hackday
  end

  private

  def goal
    @goal ||= Goal.find(params[:goal_id])
  end

  def commitment
    @commitment = goal.commitments.where(user: current_user).first
  end
end
