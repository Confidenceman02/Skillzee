class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_admin
  def index
    @users = User.all
  end

  def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User destroyed."
  redirect_to users_path
end

end
