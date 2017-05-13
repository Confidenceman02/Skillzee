class CourseDatesController < ApplicationController
before_action :set_course, except: [:update, :destroy]
before_action :set_date, only: [:destroy]
  def new
    @date = CourseDate.new
    @dates = @course.course_dates
    @paid_bookings = current_user.bookings.paid_bookings
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

  def destroy
    @date.destroy
    flash[:success] = "Date was successfully deleted"
    redirect_to new_course_course_date_path(@date.course)
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