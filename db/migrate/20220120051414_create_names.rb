class CreateNames < ActiveRecord::Migration[6.1]
  def change
    create_table :names do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.references :details, null: false, foreign_key: true
      t.timestamps
    end
  end
end
