class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.boolean :active, null: false, default: 'FALSE'
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
    
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
