class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def require_admin
    unless current_user && current_user.admin == true
      flash[:error] = "You are not an admin"
      redirect_to '/'
    end
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
