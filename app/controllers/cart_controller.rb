class CartController < ApplicationController
  

  def course_booking
    @bookings = current_user.bookings.where(:payment == false)
   
  end
  
  private


end
