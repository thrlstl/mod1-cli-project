require_relative '../config/environment'

puts "Hello valued customer 👨"
puts "Please enter your name"
customer_name = gets.chomp
current_user = User.find_by(name: customer_name)
puts "#{customer_name} Please check your profile below and contact us if any changes are necessary."
puts " User name:#{current_user.name}"
puts " User address:#{current_user.address}"
puts " User phone:#{current_user.phone}"


binding.pry