class MenuItem < ActiveRecord::Base
    has_many :orders
    has_many :users, through: :orders

    def self.print_menu
        self.all.each { |item| puts "##{item.id} — #{item.name} — $#{item.price}"}
    end
end