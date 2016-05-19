module ProjectsHelper
  def new_project_form_path
    if hackday.present?
      hackday_projects_path(hackday)
    else
      projects_path
    end
  end
end
