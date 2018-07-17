class MusicalInstrument < ApplicationRecord
  belongs_to :user, class_name: "User" , optional: true
  belongs_to :lender, class_name: "User" , optional: true
  belongs_to :borrower, class_name: "User" , optional: true

  mount_uploader :image, ImageUploader
end
