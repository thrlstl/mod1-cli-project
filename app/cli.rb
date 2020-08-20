require_relative '../config/environment'

def logo
    sleep(1)
    puts "
    █████████████████    ███ 
    ██     ██     ████  ████ 
    █████  █████  ██ ████ ██ 
    ██     ██     ██  ██  ██ ©"
    sleep(1)
end

# Allows an existing user to login via username
# or creates a new user if the username doesn't exist.
def login_signup
    puts "LOGIN ⬇ (username)"
    puts
    customer_username = gets.chomp
    @customer = User.find_or_create_by(username: customer_username)
end

# Greets new or existing user by name and allows them to choose
# from a menu of options which redirects the terminal.
def cli_menu
    system "clear"
    logo
    puts
    puts "Welcome, #{@customer.name}!"
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Fast Food", -> { full_menu }
        menu.choice "Restaurants", -> { restaurants_menu }
        menu.choice "Place Order", -> { place_an_order }
        menu.choice "Previous Orders", -> { customer_orders }
        menu.choice "Cancel Order", -> { cancel_order }
        menu.choice "My Account", -> { account_information }
        menu.choice "Logout", -> { exit }
    end
end

### PAGES ###

def full_menu
    system "clear"
    puts "FULL MENU ⬇"
    puts
    MenuItem.print_menu
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Order", -> { place_an_order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###

def restaurants_menu
    system "clear"
    puts
    restaurant_selection = $prompt.select("SELECT AN OPTION ⬇", ["McDonalds", "Subway", "Burger King"])
    restaurant_menu(restaurant_selection)
end

###

def restaurant_menu(restaurant_selection)
    system "clear"
    puts "#{restaurant_selection} Menu ⬇"
    puts
    MenuItem.menu_by_restaurant(restaurant_selection)
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Order", -> { order_by_restaurant(restaurant_selection) }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###
  
def place_an_order
    system "clear"
    puts "What would you like to order?"
    puts
    puts "FULL MENU ⬇"
    MenuItem.print_menu
    puts
    item_number = $prompt.ask("I'll have a number... ", value: "")
        new_order = Order.create(
            menu_item_id: item_number, 
            user_id: @customer.id
            )
    puts "Thank you #{@customer.name} for your order! (#{new_order.id})"
    cost = MenuItem.price_by_id(item_number.to_i)
    puts "Your total is: $#{cost}."
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Place Another Order", -> { place_an_order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

### 

def order_by_restaurant(restaurant_selection)
    system "clear"
    puts
    puts "What would you like to order from #{restaurant_selection}?"
    puts
    MenuItem.menu_by_restaurant(restaurant_selection)
    puts
    item_number = $prompt.ask("I'll have a number... ", value: "?")
        new_order = Order.create(
            menu_item_id: item_number, 
            user_id: @customer.id
            )
    puts "Thank you #{@customer.name} for your order! (##{new_order.id})"
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Place Another Order", -> { restaurants_menu }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

### 

def customer_orders
    system "clear"
    puts "YOUR ORDERS ⬇"
    puts
    @customer.orders.each { |order| p "Order # - #{order.id}"}
    # binding.pry
    # Menu Item - #{MenuItem.all[order.menu_item_id][:name]}
    #  Menu Item - #{MenuItem.all[order.menu_item_id][:name]} | Price - $#{MenuItem.all[order.menu_item_id][:price]} | Restaurant - #{MenuItem.all[order.menu_item_id][:restaurant]} "}
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Cancel Order", -> { cancel_order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###

def cancel_order
    system "clear"
    puts "YOUR ORDERS ⬇"
    puts
    @customer.orders.each { |order| p "Order # - #{order.id} | Menu Item - #{order.menu_item_id}"}
    puts
    puts "Enter ORDER NUMBER (#) to CANCEL"
    id_input = gets.chomp
    Order.destroy(id_input)
    puts
    puts "Thank you #{@customer.name}! Your order (##{id_input}) has been cancelled."
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Place Another Order", -> { place_an_order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###

def account_information
    system "clear"
    puts "ACCOUNT INFORMATION"
    puts
    puts "Name - #{@customer.name}"
    puts "Username - @#{@customer.username}"
    puts "Address - #{@customer.address}"
    puts "Phone Number - #{@customer.phone}"
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###