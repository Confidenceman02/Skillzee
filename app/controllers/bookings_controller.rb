class BookingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_course, only: [:new]
  before_action :set_booking, only: [:destroy]
  def index

  end

  def new
    @booking = Booking.new
    @dates = @course.course_dates
    @bookings = current_user.bookings
    @bookings.where(:course_date_id == @course.course_dates)
  end

  def create
    @booking = Booking.new(user_id: params[:user_id], course_date_id: params[:course_date])
    @course = @booking.course_date.course
    if @booking.save
      flash[:success] = "Date was successfully added"
      redirect_to new_booking_path(course: @course)
    else
      redirect_to 'course_dates/dates'
    end
  end

  def destroy
    @booking.destroy
    redirect_to cart_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_course
     @course = Course.find(params[:course])
  end
 
  def booking_params
    params.require(:booking).permit(:course_date, :user_id)
  end
  

end
