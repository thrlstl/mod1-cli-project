class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.float :price
      t.string :restaurant
      
      t.timestamp
    end
  end
end
