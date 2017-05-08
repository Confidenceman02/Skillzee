class BookingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_course, only: [:new]
  def index

  end

  def new
    @booking = Booking.new
    @dates = @course.course_dates
    @bookings = Booking.where(:user_id == current_user.id)
  end

  def create
    @booking = Booking.new(user_id: params[:user_id], course_date_id: params[:course_date])
    
    if @booking.save
      flash[:success] = "Date was successfully added"
    else
      redirect_to 'course_dates/dates'
    end
  end

  private

  def set_course
     @course = Course.find(params[:course])
  end
 
  def booking_params
    params.require(:booking).permit(:course_date, :user_id)
  end
  

end
