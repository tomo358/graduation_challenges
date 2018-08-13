class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :musical_instrument_id
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
  end
end
