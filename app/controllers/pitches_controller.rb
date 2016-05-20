class PitchesController < ApplicationController
  helper_method :hackday, :commitments

  def index
    @goals = hackday.goals.order(created_at: :desc)
    @project_form = ProjectForm.new(Project.new, hackday)
  end

  def create
    @project_form = ProjectForm.new(project, hackday, params)
    @project_form.goal.aim ||= @project_form.project.name
    if @project_form.save
      render partial: "goals/goal", object: @project_form.goal
    else
      logger.info @project_form.errors.full_messages.inspect
      head :not_acceptable
    end
  end

  private

  def hackday
    @hackday ||= HackdayFromDate.from_param(params[:hackday_id]).hackday
  end

  def project
    @project = if params[:project][:id].present?
      Project.find(params[:project][:id])
    else
      Project.new
    end
  end
end
