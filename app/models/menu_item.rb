class MenuItem < ActiveRecord::Base
    has_many :orders
    has_many :users, through: :orders

    def self.print_menu
        self.all.each { |item| puts "##{item.id} — #{item.restaurant} — #{item.name} — $#{item.price}"}
    end

    def self.menu_by_restaurant(restaurant)
        restaurant_menu = self.all.select { |item| item.restaurant == restaurant }
        restaurant_menu.each { |item| puts "##{item.id} - #{item.name} — $#{item.price}"}
    end

    def self.price_by_id(menu_item_id)
        found_item = MenuItem.all.find do |item|
            item.id == menu_item_id
        end
        found_item.price
    end
end