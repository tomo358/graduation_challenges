class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.integer :musical_instrument_id
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
