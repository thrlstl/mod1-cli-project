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

    def self.items_ordered
        items_ordered = Order.all.map {|order| order.menu_item_id}
    end

    def self.popular
        freq = items_ordered.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        item_id = items_ordered.max_by { |v| freq[v] }
        sleep(0.5)
        puts "                                         
        ┏━━♡ MOST POPULAR! ♡━━━━━━━━━━━--~~
        | 
        |  #{MenuItem.find_by(id: item_id).restaurant}'s #{MenuItem.find_by(id: item_id).name} 
        |               
        |   Only $#{MenuItem.find_by(id: item_id).price}                  
        ┗━━━━━━━━━━━━━━━━━━━━♡ Try it! ♡━━━--~~"
        puts
        sleep(0.5)
    end
end