class CreateAges < ActiveRecord::Migration[6.1]
  def change
    create_table :ages do |t|
      t.integer :age, null: false
      t.references :detail, null: false, foreign_key: true
      t.timestamps
    end
  end
end
