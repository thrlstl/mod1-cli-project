def graphic

    puts "
  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  |                                     |
  |  ███████  █████  ███████ ████████   |
  |  ██      ██   ██ ██         ██      |
  |  █████   ███████ ███████    ██      |
  |  ██      ██   ██      ██    ██      |
  |  ██      ██   ██ ███████    ██      |
  |                                     |
  |  ███████  ██████   ██████  ██████   |
  |  ██      ██    ██ ██    ██ ██   ██  |
  |  █████   ██    ██ ██    ██ ██   ██  |
  |  ██      ██    ██ ██    ██ ██   ██  |
  |  ██       ██████   ██████  ██████   |
  |                                     |
  |  ███    ███ ███████                 |
  |  ████  ████ ██                      |
  |  ██ ████ ██ █████                   |
  |  ██  ██  ██ ██                      |
  |  ██      ██ ███████                 |
  |                                     |
  ┗━━━━━━━━━━━━━━━━━━♡ Like It's 1985 ♡━┛ "     
    sleep(1)
    puts "
     ╔.  Matthew Steele  .═════════╗

     ╚═════════. Muhammet Yildiz  .╝ "
    puts
    sleep(1)                               
end

def menu_header
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | FASTFOODME                          |
    ┗━━━━━━━━━━━━━━━━━♡ Like It's 1985 ♡━━┛ "
  puts
  sleep(0.5)
end

def master_menu
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | Can't Decide?                       |
    ┗━━━━━━━━━━━━━♡ See What's Popular! ♡━┛ "
  puts
  sleep(0.5)
end

def restaurants_header
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | What are you hungry for?            |
    ┗━━━━━━━━━━━━━━━━━━━━━♡ FASTFOODME! ♡━┛ "
  puts
  sleep(0.5)
end

def mcdonalds_menu
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | MCDONALDS                           |
    ┗━━━━━━━━━━━━━━━━━━━♡ I'm Lovin' It ♡━┛ "
  puts
  sleep(0.5)
end

def subway_menu
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | SUBWAY                              |
    ┗━━━━━━━━━━━━━━━━━━━♡ Eat Fresh ♡━━━━━┛ "
  puts
  sleep(0.5)
end

def burger_king_menu
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | BURGER KING                         |
    ┗━━━━━━━━━━━━━━━♡ Have It Your Way ♡━━┛ "
  puts
  sleep(0.5)
end

def place_order_header
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | What would you like to order?       |
    ┗━━━━━━━━━━━━━━━━━━━━♡ It's Cookin! ♡━┛ "
  puts
  sleep(0.5)
end

def customer_orders_header
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | Thank you for your loyalty!         |
    ┗━━━━━━━━━━━━━━━━━━━━━♡ -FastFoodMe ♡━┛ "
  puts
  sleep(0.5)
end

def cancel_order_header
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | Which order would you like to cancel? | ⬇
    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
  puts
  sleep(0.5)
end

def account_information_graphic
  sleep(0.5)
  puts "                                         
    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    | FASTFOODME                            | 
    ┗━━━━━━━━━━━━━━━━━━━━━━━♡ My Account ♡━━┛"
  puts
  sleep(0.5)
  puts "                                         
    ━━━━FULL NAME━━━━       ━━━━USERNAME━━━━
    #{@customer.name}           @#{@customer.username}
    
    ━━━━━ADDRESS━━━━━
    #{@customer.address}

    ━━━━━━PHONE━━━━━━
    #{@customer.phone} 
    "
  puts
end