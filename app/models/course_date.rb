class CourseDate < ApplicationRecord
  belongs_to :course
  has_many :bookings, dependent: :destroy
end
