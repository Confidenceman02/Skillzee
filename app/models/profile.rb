class Profile < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  belongs_to :user
  validates :gender, presence: true
end