class MusicalInstrument < ApplicationRecord
  belongs_to :user, class_name: "User" , optional: true
  belongs_to :lender, class_name: "User" , optional: true
  belongs_to :borrower, class_name: "User" , optional: true

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :image, ImageUploader
end
