class AdminDashboardController < ApplicationController
  def home
    @users = User.all
  end
end