class ProjectForm
  attr_reader :project, :goal

  def initialize(project, hackday = nil, params = nil)
    @project = project || Project.new
    @hackday = hackday
    @params = params

    apply_params if params.present?
  end

  delegate :id, :name, :url, :description, :repository_url, to: :project
  delegate :model_name, :to_key, :to_model, :errors, to: :project

  def save
    valid? && project.save
  end

  def valid?
    project.valid? && (goal.blank? || goal.valid?)
  end

  def user_ids
    @project.goals.flat_map(&:commitments).flat_map(&:user_id).uniq
  end

  def user_ids=(ids)
    return unless ids.present?

    ids.reject(&:blank?).each do |id|
      @goal.commitments.build(user_id: id)
    end
  end

  protected

  def apply_params
    project.attributes = filtered_params.except(:id, :goal, :user_ids) \
      unless filtered_params[:id].present?
    if @hackday.present?
      @goal = project.goals.build(goal_params)
      @goal.aim = project.name if @goal.aim.blank?
    end
    self.user_ids = filtered_params[:user_ids]
  end

  def filtered_params
    @filtered_params ||= @params.require(:project)
      .permit(
        :id,
        :name,
        :url,
        :description,
        :repository_url,
        :user_ids => [],
        :goal => [:aim, :help_required]
      )
  end

  def goal_params
    (filtered_params[:goal] || {}).merge(hackday: @hackday)
  end
end
