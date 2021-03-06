class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin
  def index
    @users = User.all
  end

  def destroy
  # Only admin has the ability to delete a profile.
  User.find(params[:id]).destroy
  flash[:success] = "User deleted."
  redirect_to users_path
  end

end
