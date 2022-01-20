class CreateDescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :descriptions do |t|
      t.string :body, null: false, default: ''
      t.references :describable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
