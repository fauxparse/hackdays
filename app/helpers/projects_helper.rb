module ProjectsHelper
  def new_project_form_path
    if hackday.present?
      hackday_projects_path(hackday)
    else
      projects_path
    end
  end

  def working_on?(goal)
    goal.users.include?(current_user)
  end

  def other_goals
    @goals.reject { |goal| working_on?(goal) }
  end

  def project_goals
    @project.goals.sort { |g1, g2| g2.hackday <=> g1.hackday }
  end

  def project_ids_for_select
    Project.order(name: :asc).pluck(:name, :id)
  end
end
