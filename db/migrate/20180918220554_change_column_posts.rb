class ChangeColumnPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id, :integer, null: false
  end
end
