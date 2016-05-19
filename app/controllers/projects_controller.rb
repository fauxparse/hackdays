class ProjectsController < ApplicationController
  def index
    @projects = project_scope.all
  end

  private

  def project_scope
    Project
  end
end
