class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :address, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :state, null: false, default: ''
      t.string :country, null: false, default: ''
      t.integer :zip, null: false, default: 00000
      t.references :details, null: false, foreign_key: true
      t.timestamps
    end
  end
end
