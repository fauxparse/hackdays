class HackdaysController < ApplicationController
  helper_method :hackday

  def index
  end

  def show
    @projects = Project.all
  end

  private

  def hackday
    @hackday ||= HackdayFromDate.from_param(params[:id]).hackday
  end
end
