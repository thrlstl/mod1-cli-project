Order.destroy_all
User.destroy_all
MenuItem.destroy_all

10.times do
    User.create(
        username: Faker::Internet.username(specifier: 5..8),
        password: Faker::Internet.password(min_length: 5, max_length: 5),
        name: Faker::Name.unique.name,
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.cell_phone
    )
end

MenuItem.create(
name: "Big Mac",
price: 3.55,
restaurant: "McDonalds"
)
MenuItem.create(
name: "Cheeseburger Combo Meal",
price: 5.63,
restaurant: "McDonalds"
)
MenuItem.create(
name: "Filet-O-Fish",
price: 4.25,
restaurant: "McDonalds"
)
MenuItem.create(
name: "Coca-Cola",
price: 1.79,
restaurant: "McDonalds"
)
MenuItem.create(
name: "Baked Apple Pie",
price: 4.35,
restaurant: "McDonalds"
)
MenuItem.create(
name: "Chocolate Shake",
price: 3.29,
restaurant: "Subway"
)
MenuItem.create(
name: "Cold Cut Combo",
price: 4.99,
restaurant: "Subway"
)
MenuItem.create(
name: "Spicy Italian",
price: 5.49,
restaurant: "Subway"
)
MenuItem.create(
name: "Steak & Cheese",
price: 6.29,
restaurant: "Subway"
)
MenuItem.create(
name: "Tuna",
price: 5.29,
restaurant: "Subway"
)
MenuItem.create(
name: "Double Whopper",
price: 5.29,
restaurant: "Burger King"
)
MenuItem.create(
name: "Whopper Jr. – Meal",
price: 5.15,
restaurant: "Burger King"
)
MenuItem.create(
name: "Chicken Nuggets – Meal",
price: 5.99,
restaurant: "Burger King"
)
MenuItem.create(
name: "Big Fish Sandwich",
price: 3.99,
restaurant: "Burger King"
)
MenuItem.create(
name: "Cookies",
price: 1.75,
restaurant: "Burger King"
)


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

