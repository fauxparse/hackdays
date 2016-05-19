class ProjectForm
  attr_reader :project, :goal

  def initialize(project, hackday = nil, params = nil)
    @project = project || Project.new
    @hackday = hackday
    @params = params

    apply_params if params.present?
  end

  delegate :name, :url, :description, :repository_url, to: :project
  delegate :model_name, :to_key, :to_model, :errors, to: :project

  def save
    valid? && project.save
  end

  def valid?
    project.valid? && (goal.blank? || goal.valid?)
  end

  protected

  def apply_params
    project.attributes = filtered_params.except(:goal)
    @goal = project.goals.build(goal_params) if @hackday.present?
  end

  def filtered_params
    @filtered_params ||= @params.require(:project)
      .permit(
        :name,
        :url,
        :description,
        :repository_url,
        :goal => [:aim, :help_required]
      )
  end

  def goal_params
    (filtered_params[:goal] || {}).merge(hackday: @hackday)
  end
end
