class CreateMusicalInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :musical_instruments do |t|
      t.integer :contact_id
      t.integer :user_id
      t.text :name
      t.text :content
      t.text :image
      t.integer :lender_id
      t.integer :borrower_id
      t.text :contact

      t.timestamps
    end
  end
end
