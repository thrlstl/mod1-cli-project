require_relative '../config/environment'

# Allows an existing user to login via username
# or creates a new user if the username doesn't exist.
def login_signup
    customer_username = $prompt.ask("Username:", value: "")
    @customer = User.find_or_create_by(username: customer_username)
end

# Greets new or existing user by name and allows them to choose
# from a menu of options which redirects the terminal.
def cli_menu
    system "clear"
    menu_header
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
    master_menu
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
    restaurants_header
    restaurant_selection = $prompt.select("SELECT AN OPTION ⬇", ["McDonalds", "Subway", "Burger King"])
    system "clear"
    restaurant_menu(restaurant_selection)
end

###

def restaurant_menu(restaurant_selection)
    system "clear"
    if restaurant_selection == "McDonalds"
        mcdonalds_menu
    elsif restaurant_selection == "Subway"
        subway_menu
    else restaurant_selection == "Burger King" 
        burger_king_menu
    end
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
    place_order_header
    puts
    MenuItem.print_menu
    puts
    item_number = $prompt.ask("I'll have a number... ", value: "")
        new_order = Order.create(
            menu_item_id: item_number, 
            user_id: @customer.id
            )
    cost = MenuItem.price_by_id(item_number.to_i)
    sleep(0.5)
    puts "                                         
    ┏━━♡ Your Receipt ♡━━━━━━━━━━━━━━━━━━━━━━--~~
    | Thank you #{@customer.name} for your order! 
    |   
    |   ORDER NUMBER - ##{new_order.id}            
    |   ORDER TOTAL - $#{cost}                  
    ┗━━━━━━━━━━━━━━━━━━━━♡ Come again! ♡━━━━━--~~"
    puts
    sleep(0.5)
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Place Another Order", -> { place_an_order }
        menu.choice "Cancel Order", -> { cancel_order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

### 

def order_by_restaurant(restaurant_selection)
    system "clear"
    if restaurant_selection == "McDonalds"
        mcdonalds_menu
    elsif restaurant_selection == "Subway"
        subway_menu
    else restaurant_selection == "Burger King" 
        burger_king_menu
    end
    MenuItem.menu_by_restaurant(restaurant_selection)
    puts
    item_number = $prompt.ask("I'll have a number... ", value: "")
        new_order = Order.create(
            menu_item_id: item_number, 
            user_id: @customer.id
            )
    cost = MenuItem.price_by_id(item_number.to_i)
    sleep(0.5)
    puts "                                         
    ┏━━♡ Your Receipt ♡━━━━━━━━━━━━━━━━━━━━━━--~~
    | Thank you #{@customer.name} for your order! 
    |   
    |   ORDER NUMBER - ##{new_order.id}            
    |   ORDER TOTAL - $#{cost}                  
    ┗━━━━━━━━━━━━━━━━━━━━♡ Come again! ♡━━━━━--~~"
    puts
    sleep(0.5)
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Place Another Order", -> { restaurants_menu }
        menu.choice "Cancel Order", -> { cancel_order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

### 

def customer_orders
    system "clear"
    customer_orders_header
    @customer.orders.each do |order| 
        puts "
    ┏━━♡ #{@customer.name} ♡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--~~
    | Order - #{order.id} | #{MenuItem.find_by(id: order.menu_item_id).name} | $#{MenuItem.find_by(id: order.menu_item_id).price} | #{MenuItem.find_by(id: order.menu_item_id).restaurant}
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--~~"  
    end 
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
    cancel_order_header
    @customer.orders.each do |order| 
        puts "
    ┏━━♡ #{@customer.name} ♡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--~~
    | Order - #{order.id} | #{MenuItem.find_by(id: order.menu_item_id).name} | $#{MenuItem.find_by(id: order.menu_item_id).price} | #{MenuItem.find_by(id: order.menu_item_id).restaurant}
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--~~"  
    end 
    puts
    id_input = $prompt.ask("Confirm ORDER NUMBER to CANCEL... ", value: "")
    Order.destroy(id_input)
    sleep(0.5)
    puts "                                         
    ┏━━♡ Void Receipt ♡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--~~
    | #{@customer.name}, your order was cancelled. 
    |   
    |   ORDER NUMBER - ##{id_input}                            
    ┗━━━━━━━━━━━━━━━━━━━━♡ Come again! ♡━━━━━━━━━━━━━--~~"
    puts
    sleep(0.5)
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Place Another Order", -> { place_an_order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###

def account_information
    system "clear"
    account_information_graphic
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###