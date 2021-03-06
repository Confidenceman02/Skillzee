class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only:[:index]


  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @countries = ISO3166::Country.codes.map { |country_code| 
    ISO3166::Country.new(country_code) }
    @date = CourseDate.new
  end

  def create
    @course = Course.new(course_params) 
    @course.user = current_user
    if @course.save
      flash[:success] = "Course was successfully saved"
      redirect_to new_course_course_date_path(@course)
    else
      render 'new'
    end
  end

  def edit
    @countries = ISO3166::Country.codes.map { |country_code| 
    ISO3166::Country.new(country_code) }
  end

  def update
    @course.update(course_params)
    redirect_to new_course_course_date_path(@course)
  end

  def show
  end

  def destroy
    @course.destroy
    redirect_to '/'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category])
  end

  def course_params
    params.require(:course).permit(:price, :title, :image, :address, :country_code, :city, :duration, :about_teacher, :state, :description, :max_students, :notes, category_ids: [])
  end

end
