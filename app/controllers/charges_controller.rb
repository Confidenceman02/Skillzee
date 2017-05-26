class ChargesController < ApplicationController

  def new
    @bookings = current_user.bookings.no_payments
    @total = @bookings.joins(course_date: [:course]).sum(:price)
    
  end

  def create
    @bookings = current_user.bookings.no_payments
    @total = @bookings.joins(course_date: [:course]).sum(:price)

    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @total,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
  
  @bookings.each {|pending| pending.toggle!(:payment)}


  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
end