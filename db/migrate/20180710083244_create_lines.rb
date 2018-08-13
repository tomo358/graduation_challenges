class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.text :name

      t.timestamps
    end
  end
end
