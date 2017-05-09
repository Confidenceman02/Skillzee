class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course_date
  # has_one :rating, dependent: :destroy
  scope :no_payments, -> {where(payment: false)}
  scope :paid_booking, -> {where(payment: true)}
  #has_one :course, through: :course_date

  def price
    course.price
    #course_date.course.price
  end

end
