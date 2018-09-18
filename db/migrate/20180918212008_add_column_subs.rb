class AddColumnSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :post_id, :integer
  end
end
