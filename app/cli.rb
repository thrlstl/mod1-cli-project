require_relative '../config/environment'

def logo
    puts "
    █████████████████    ███ 
    ██     ██     ████  ████ 
    █████  █████  ██ ████ ██ 
    ██     ██     ██  ██  ██ ©"
end


def login_signup
    puts "LOGIN ⬇ (username)"
    customer_username = gets.chomp
    @customer = User.find_or_create_by(username: customer_username)
end

def cli_menu
    system "clear"
    logo
    puts
    puts ("Welcome, #{@customer.name}!")
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "View Menu", -> { full_menu }
        menu.choice "Place Order", -> { order }
        menu.choice "Previous Orders", -> { orders }
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
        menu.choice "Order", -> { order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

###
  
def order
    system "clear"
    puts "What would you like to order?"
    puts
    puts "FULL MENU ⬇"
    MenuItem.print_menu
    puts
    item_number = $prompt.ask("I'll have a number... ", value: "?")
        new_order = Order.create(
            menu_item_id: item_number, 
            user_id: @customer.id
            )
    puts "Thank you #{@customer.name} for your order! (##{new_order.id})"
    puts
    $prompt.select("SELECT AN OPTION ⬇") do |menu|
        menu.choice "Place Another Order", -> { order }
        menu.choice "Main Menu", -> { cli_menu }
        menu.choice "Logout", -> { exit }
    end
end

### 

def orders
    system "clear"
    puts "YOUR ORDERS ⬇"
    puts
    @customer.orders.each { |order| p "Order # - #{order.id} | Menu Item - #{order.menu_item_id}"}
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
        menu.choice "Place Another Order", -> { order }
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