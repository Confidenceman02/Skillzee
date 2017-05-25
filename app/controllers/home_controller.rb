class HomeController < ApplicationController
  def index
    @navbar_dsbl = true
  end

  def about
  end

  def courses_all
    # show courses respective to category
    @category = Category.all

  end
end