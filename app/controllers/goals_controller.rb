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

  def edit
    goal
  end

  def update
    if goal.update(goal_params)
      redirect_to goal.project
    else
      render :edit
    end
  end

  private

  def project
    @project ||= Project.find_by(url: params[:project_id])
  end

  def goal_params
    params.require(:goal).permit(:aim, :help_required)
  end

  def goal
    @goal ||= Goal.includes(:project).find(params[:id])
  end
end
