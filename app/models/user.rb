class User < ApplicationRecord
  has_many :musical_instruments, dependent: :destroy
  has_many :borrowed_musical_instruments, foreign_key: 'borrower_id', class_name: 'MusicalInstrument'
  has_many :lended_musical_instruments, foreign_key: 'lender_id', class_name: 'MusicalInstrument'
  has_many :favorites, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
