class HomeController < ApplicationController
  def index
    # Navbar to not be seen on index page
    @navbar_dsbl = true
  end

  def about
  end

  def courses_all
    # show courses respective to category
    @category = Category.all
    @food = Category.category_picker('Food')
    @jewellery = Category.category_picker('jewellery')
  end
end
