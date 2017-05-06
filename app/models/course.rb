class Course < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  belongs_to :user
  has_many :course_dates, dependent: :destroy
  has_many :course_categories, dependent: :destroy
  has_many :categories, :through => :course_categories

  # https://github.com/alexreisner/geocoder
  geocoded_by :full_street_address, latitude: :lat, longitude: :lng
  after_validation :geocode

  def country
    ISO3166::Country.new(country_code)
  end

  def full_street_address
    [address, city, country.name].compact.join(',')
  end
  
end