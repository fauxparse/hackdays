class HackdaysController < ApplicationController
  helper_method :hackday, :commitments

  def index
  end

  def show
    @projects = Project.all
    @commitments = CommitmentsForUser.new(current_user, hackday).commitments
    @goals = HackdayGoals.new(hackday).goals
  end

  private

  def hackday
    @hackday ||= HackdayFromDate.from_param(params[:id]).hackday
  end
end
