class CartController < ApplicationController
  
  def course_booking
    @bookings = current_user.bookings.no_payments
    @total = @bookings.joins(course_date: [:course]).sum(:price)
    # .course_dates.pluck(:price).sum
  end
  
  private
end
