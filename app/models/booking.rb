class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course_date
  has_one :rating
end
