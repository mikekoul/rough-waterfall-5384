require 'rails_helper'

RSpec.describe 'supermarket items index page' do
  describe '#index' do
    it 'shows a unique list of the all the items a supermarket has' do
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
      CustomerItem.create!(customer_id: mike.id, item_id: potatoes.id)
      CustomerItem.create!(customer_id: mike.id, item_id: onions.id)
      CustomerItem.create!(customer_id: ken.id, item_id: potatoes.id)

      visit "/supermarkets/#{ideal.id}/items"

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

      within "#items3" do
        expect(page).to have_content("Onions")
        expect(page).to_not have_content("Potatoes")
      end
    end
  end
end