# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ideal = Supermarket.create!(name: 'Ideal Market', location: 'Capitol Hill')
soopers = Supermarket.create!(name: 'King Soopers', location: 'Aurora')

mike = Customer.create!(name: "Mike", supermarket_id: ideal.id)
rob = Customer.create!(name: "Rob", supermarket_id: ideal.id)
cindy = Customer.create!(name: "Cindy", supermarket_id: ideal.id)

ken = Customer.create!(name: "Ken", supermarket_id: soopers.id)
hayley = Customer.create!(name: "Hayley", supermarket_id: soopers.id)
justin = Customer.create!(name: "Justin", supermarket_id: soopers.id)

banana = Item.create!(name: 'Banana', price: 200)
bread = Item.create!(name: 'Bread', price: 600)
potatoes = Item.create!(name: 'Potatoes', price: 400)
onions = Item.create!(name: 'Onions', price: 600)
granola = Item.create!(name: 'Granola', price: 1000)
apples = Item.create!(name: 'Apples', price: 800)