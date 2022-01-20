class CreateNames < ActiveRecord::Migration[6.1]
  def change
    create_table :names do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.references :detail, null: false, foreign_key: true
      t.timestamps
    end
  end
end
