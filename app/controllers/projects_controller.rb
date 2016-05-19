class ProjectsController < ApplicationController
  helper_method :hackday

  def index
    @hackdays = Hackday.most_recent_first.with_goals
  end

  def show
    @project = Project.with_full_information.find_by(url: params[:id])
  end

  def new
    @project_form = ProjectForm.new(Project.new, hackday)
  end

  def create
    @project_form = ProjectForm.new(Project.new, hackday, params)

    if @project_form.save
      @project_form.goal.commitments.create(user: current_user) if hackday
      redirect_to @project_form.project
    else
      render :new
    end
  end

  private

  def hackday
    @hackday = params[:hackday_id] &&
      HackdayFromDate.from_param(params[:hackday_id]).hackday
  end
end
