class SearchController < ApplicationController
  def courses
    # category = params[:search]
    @category = Category.where(category: params[:search].capitalize).first
    @courses = @category.courses
  end

end
