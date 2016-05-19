class UsersController < ApplicationController
  def index
    @users = User.active.alphabetically
  end

  def show
    @user = User.find_by(url: params[:id])
    @goals = GoalsForUser.new(@user).goals
  end
end
