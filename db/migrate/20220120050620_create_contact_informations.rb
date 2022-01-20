class CreateContactInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_informations do |t|
      t.string :phone_number, null: false, default: '000-000-0000'
      t.references :details, null: false, foreign_key: true
      t.timestamps
    end
  end
end
