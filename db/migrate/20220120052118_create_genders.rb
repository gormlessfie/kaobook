class CreateGenders < ActiveRecord::Migration[6.1]
  def change
    create_table :genders do |t|
      t.string :gender
      t.references :detail, null: false, foreign_key: true
      t.timestamps
    end
  end
end
