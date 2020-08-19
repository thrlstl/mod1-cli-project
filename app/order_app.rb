require_relative '../config/environment'
require "tty-prompt"

ActiveRecord::Base.logger = nil

def prompt
    prompt = TTY::Prompt.new
end


def clear!
    puts `clear`
end

def login_signup
    puts "LOGIN ⬇ (username)"
    customer_username = gets.chomp
    @customer = User.find_or_create_by(username: customer_username)
    password = prompt.mask("LOGIN ⬇ (password)")
    if @customer.password == password
    clear!
    else   
    p "Incorrect password, please try again."
    end
end

def app_menu
    puts "Welcome, #{@customer.name}!"
    puts
    menu_options = ["View Menu", "Place Order", "Previous Orders", "Cancel Order", "My Account"]
    prompt.select("SELECT AN OPTION ⬇", menu_options)
    
    # puts <<~TEXT
    # Welcome #{@customer.name}!
    # SELECT AN OPTION ⬇
    # 1. View Menu
    # 2. Place Order
    # 3. Previous Orders
    # 4. Cancel Order
    # 5. My Account
    # TEXT
    # input = gets.chomp

    clear!
end

###

# APPLICATION MENU

# puts <<~TEXT
# Welcome #{customer.name}!
# SELECT AN OPTION ⬇
# 1. View Menu
# 2. Place Order
# 3. Previous Orders
# 4. Cancel Order
# 5. My Account
# TEXT
# input = gets.chomp

# clear!

# ##

# # PAGES

# case input

# when "1"
#   puts "FULL MENU ⬇"
#   MenuItem.all.each do |item|
#     puts "##{item.id} — #{item.name} — $#{item.price}"
#   end
  
# when "2"
#     puts "Place Order"
#     puts "FULL MENU ⬇"
#     MenuItem.all.each do |item|
#       puts "##{item.id} — #{item.name} — $#{item.price}"
#     end
#     print "ADD TO ORDER (#)"
#     id = gets.chomp

#   new_order = Order.create(
#     menu_item_id: id, 
#     user_id: customer.id
#   )

#   clear!

#     puts "Thank you #{customer.name} for your order! (##{new_order.id})"

# when "3"
    
#     puts "YOUR ORDERS ⬇"
#     order_receipts = customer.orders.each do |order|
#         p "Order # - #{order.id} | Menu Item - #{order.menu_item_id}"
#     end

# when "4"

#     puts "YOUR ORDERS ⬇"
#     order_receipts = customer.orders.each do |order|
#         p "Order # - #{order.id} | Menu Item - #{order.menu_item_id}"
#     end
    
#     puts "Enter ORDER NUMBER (#) to CANCEL"
#     id_input = gets.chomp
#     Order.destroy(id_input)

#     clear!

#     puts "Thank you #{customer.name}! Your order (##{id_input}) has been cancelled."

# when "5"

#     puts "ACCOUNT INFORMATION"
#     puts "Name - #{customer.name}"
#     puts "Username - #{customer.username}"
#     puts "Address - #{customer.address}"
#     puts "Phone Number - #{customer.phone}"

# end