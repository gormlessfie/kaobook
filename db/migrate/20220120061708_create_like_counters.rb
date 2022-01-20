class CreateLikeCounters < ActiveRecord::Migration[6.1]
  def change
    create_table :like_counters do |t|
      t.integer :likes, null: false, default: 0
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
