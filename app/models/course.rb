class Course < ApplicationRecord
  belongs_to :user
  has_many :course_dates
  has_many :images
  has_many :course_categories
  has_many :categories, :through => :course_categories
  
end