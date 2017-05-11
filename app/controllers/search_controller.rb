class SearchController < ApplicationController
  def courses
    # category = params[:search]
    @category = Category.where(category: 'Food').first
    @courses = @category.courses
  end

end
