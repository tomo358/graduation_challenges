class MusicalInstrument < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  
  mount_uploader :image, ImageUploader
end
