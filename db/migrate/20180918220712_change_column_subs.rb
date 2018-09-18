class ChangeColumnSubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :post_id, :integer
  end
end
