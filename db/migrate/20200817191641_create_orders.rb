class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :menu_item_id
      t.float :order_total

      t.timestamp
    end
  end
end
