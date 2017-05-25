class Category < ApplicationRecord
  
  has_many :course_categories
  has_many :courses, :through => :course_categories
  # scope :food, -> {where(category: 'Food').first}

  def self.category_picker(category)
    where(:category == category).first
  end
end