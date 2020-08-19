require_relative '../config/environment'

def clear!
    puts `clear`
end

# LOGIN / SIGN-UP

puts "Hello valued customer 👨"
puts "LOGIN ⬇ (username)"
customer_username = gets.chomp
customer = User.find_or_create_by(username: customer_username)



###

# APPLICATION MENU

puts <<~TEXT
Welcome #{customer.name}!
SELECT AN OPTION ⬇
1. View Menu
2. Place Order
3. Cancel Order
4. Order Status
5. Previous Orders
6. My Account
TEXT
input = gets.chomp

clear!

###

# PAGES

case input

when "1"
  puts "FULL MENU ⬇"
  MenuItem.all.each do |item|
    puts "##{item.id} — #{item.name} — $#{item.price}"
  end
  
when "2"
    puts "Place Order"
    puts "FULL MENU ⬇"
    MenuItem.all.each do |item|
      puts "##{item.id} — #{item.name} — $#{item.price}"
    end
    print "ADD TO ORDER (#)"
    id = gets.chomp

  new_order = Order.create(
    menu_item_id: id, 
    user_id: customer.id
  )

  clear!

    puts "Thank you #{customer.name} for your order! (##{new_order.id})"

when "3"
    puts "YOUR ORDERS ⬇"
    customer.orders
    puts "Enter ORDER NUMBER (#) to CANCEL"
    id_input = gets.chomp
    Order.destroy(id_input)

    clear!

when "4"
    puts "Order Status"

when "5"
    puts "Previous Orders"

when "6"
    puts "ACCOUNT INFORMATION"
    puts "Name - #{customer.name}"
    puts "Username - #{customer.username}"
    puts "Address - #{customer.address}"
    puts "Phone Number - #{customer.phone}"

end

binding.pry