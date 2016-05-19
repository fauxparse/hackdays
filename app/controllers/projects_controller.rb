class ProjectsController < ApplicationController
  helper_method :hackday

  def index
    @hackdays = Hackday.most_recent_first.with_goals
  end

  def show
    project
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

  def edit
    @project_form = ProjectForm.new(project, nil)
  end

  def update
    @project_form = ProjectForm.new(project, nil, params)

    if @project_form.save
      redirect_to @project_form.project
    else
      render :edit
    end
  end

  private

  def hackday
    @hackday = params[:hackday_id] &&
      HackdayFromDate.from_param(params[:hackday_id]).hackday
  end

  def project
    @project ||= Project.with_full_information.find_by(url: params[:id])
  end
end
