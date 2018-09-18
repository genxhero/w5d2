class SubPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_posts do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end
    add_index :subposts, :sub_id
    add_index :subposts, :post_id
  end
end
