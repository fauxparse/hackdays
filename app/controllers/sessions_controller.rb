class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated

  def create
    if user = UserFromOauth.new(oauth).user
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to "/auth/#{oauth['provider']}"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def oauth
    request.env['omniauth.auth']
  end
end
