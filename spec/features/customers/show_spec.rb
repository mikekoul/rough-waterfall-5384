require 'rails_helper'

RSpec.describe 'customer show page' do
  describe '#show' do
    it 'displays a list of items and the supermarket they belong to' do
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

      CustomerItem.create!(customer_id: mike.id, item_id: banana.id)
      CustomerItem.create!(customer_id: mike.id, item_id: bread.id)
      CustomerItem.create!(customer_id: mike.id, item_id: potatoes.id)
      CustomerItem.create!(customer_id: ken.id, item_id: onions.id)

      visit "/customers/#{mike.id}"

      within "#items0" do
        expect(page).to have_content("Banana")
        expect(page).to_not have_content("Bread")
      end

      within "#items1" do
        expect(page).to have_content("Bread")
        expect(page).to_not have_content("Banana")
      end

      within "#items2" do
        expect(page).to have_content("Potatoes")
        expect(page).to_not have_content("Onions")
      end
    end

    it 'displays the name of the supermarket the customer belongs to' do
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

      CustomerItem.create!(customer_id: mike.id, item_id: banana.id)
      CustomerItem.create!(customer_id: mike.id, item_id: bread.id)
      CustomerItem.create!(customer_id: mike.id, item_id: potatoes.id)
      CustomerItem.create!(customer_id: ken.id, item_id: onions.id)

      visit "/customers/#{mike.id}"

      expect(page).to have_content("Ideal Market")
      expect(page).to_not have_content("King Soopers")
    end
  end
end