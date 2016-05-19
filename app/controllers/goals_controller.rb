class GoalsController < ApplicationController
  helper_method :project

  def new
    @goal = project.goals.build
  end

  def create
    @goal = project.goals.build(goal_params)
    @goal.hackday = Hackday.upcoming.first
    if @goal.save
      redirect_to project
    else
      render :new
    end
  end

  private

  def project
    @project ||= Project.find_by(url: params[:project_id])
  end

  def goal_params
    params.require(:goal).permit(:aim, :help_required)
  end
end
