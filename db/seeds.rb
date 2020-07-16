# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PurchaseOrder.destroy_all
Sale.destroy_all
Vendor.destroy_all
Game.destroy_all
Employee.destroy_all
Customer.destroy_all

Employee.create(name: Faker::Name.name, address: Faker::Address.full_address, email: Faker::Internet.email, username: '1', password: '1')

10.times do
    Customer.create(name: Faker::Name.name, address: Faker::Address.full_address, email: Faker::Internet.email)
end

10.times do
    Employee.create(name: Faker::Name.name, address: Faker::Address.full_address, email: Faker::Internet.email, username: Faker::Internet.username, password: '1')
end

10.times do
    Game.create(name: Faker::Game.title, genre: Faker::Game.genre, sales_price: rand(2) == 1 ? 40.00 : 60.00, vendor_cost: rand(2) == 1 ? 30.00 : 45.00, stock: rand(100), threshold: rand(100))
end

10.times do
    Vendor.create(name: Faker::Company.name, address: Faker::Address.full_address, email: Faker::Internet.email)
end

5.times do
    game_offset = rand(Game.count)
    game_record = Game.offset(game_offset).first

    vendor_offset = rand(Vendor.count)
    vendor_record = Vendor.offset(vendor_offset).first

    employee_offset = rand(Employee.count)
    employee_record = Employee.offset(employee_offset).first

    PurchaseOrder.create(game: game_record, vendor: vendor_record, employee: employee_record, quantity: Faker::Number.number(digits: 3))
end

100.times do
    game_offset = rand(Game.count)
    game_record = Game.offset(game_offset).first

    customer_offset = rand(Customer.count)
    customer_record = Customer.offset(customer_offset).first

    employee_offset = rand(Employee.count)
    employee_record = Employee.offset(employee_offset).first

    Sale.create(game: game_record, customer: customer_record, employee: employee_record, quantity: Faker::Number.number(digits: 1), created_at: Faker::Date.backward(days: 365))
end