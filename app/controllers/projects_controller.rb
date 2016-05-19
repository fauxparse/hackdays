class ProjectsController < ApplicationController
  helper_method :hackday

  def index
    @projects = project_scope.all
  end

  def show
    @project = Project.find_by(url: params[:id])
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

  def project_scope
    Project
  end

  def hackday
    @hackday = params[:hackday_id] &&
      HackdayFromDate.from_param(params[:hackday_id]).hackday
  end
end
