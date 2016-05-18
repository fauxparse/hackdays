class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_authenticated

  helper_method :current_user, :logged_in?

  private

  def ensure_authenticated
    redirect_to "/auth/google_oauth2" unless logged_in?
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= current_user_id && User.find_by(id: current_user_id)
  end

  def current_user_id
    session[:user_id]
  end
end
