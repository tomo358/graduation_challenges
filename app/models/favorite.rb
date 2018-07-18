class Favorite < ApplicationRecord
  belongs_to :musical_instrument
  belongs_to :user
end
