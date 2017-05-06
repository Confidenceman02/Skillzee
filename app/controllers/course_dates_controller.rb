class CourseDatesController < ApplicationController
before_action :set_course, except: [:update]
  def new
    @date = CourseDate.new
    @dates = CourseDate.all
  end

  def create 
    @date = CourseDate.new(date_params)
    @date.course = @course
    if @date.save
      flash[:success] = "Date successfully added"
      redirect_to new_course_course_date_path(@course)
    else
      render 'new'
    end
  end

private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_date
    @date = CourseDate.find(params[:id])
  end

  def date_params
    params.require(:course_date).permit(:date, :time)
  end

end