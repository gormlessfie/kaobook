class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :address, default: ''
      t.string :city, default: ''
      t.string :state, default: ''
      t.string :country, default: ''
      t.integer :zip, default: 00000
      t.references :detail, null: false, foreign_key: true
      t.timestamps
    end
  end
end
