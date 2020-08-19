Order.destroy_all
User.destroy_all
MenuItem.destroy_all


10.times do 
User.create(
    username: Faker::Internet.username(specifier: 5..8),
    password: Faker::Internet.password(min_length: 10, max_length: 20),   
    name: Faker::Name.unique.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone
)
end

10.times do
MenuItem.create(
    name: Faker::Food.dish,
    price: Faker::Number.decimal(l_digits: 2) #=> 11.88
)
end


Order.create(
    user_id: User.first.id,
    menu_item_id: MenuItem.first.id
)
Order.create(
    user_id: User.second.id,
    menu_item_id: MenuItem.first.id
)
Order.create(
    user_id: User.second.id,
    menu_item_id: MenuItem.second.id
)
Order.create(
    user_id: User.last.id,
    menu_item_id: MenuItem.first.id
)
Order.create(
    user_id: User.third.id,
    menu_item_id: MenuItem.second.id   
)
Order.create(
    user_id: User.last.id,
    menu_item_id: MenuItem.third.id   
)
Order.create(
    user_id: User.first.id,
    menu_item_id: MenuItem.last.id   
)

