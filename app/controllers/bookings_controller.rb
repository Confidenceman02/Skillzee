class BookingsController < ApplicationController
  before_action :set_course, only: [:index, :new]
  def index

  end

  def new
    @booking = Booking.new
    @dates = @course.course_dates
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
