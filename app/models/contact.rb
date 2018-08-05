class Contact < ApplicationRecord
    has_one :musical_instrument, dependent: :destroy
end
