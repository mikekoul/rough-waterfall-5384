require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:items).through(:customer_items) }
  end

  describe '#methods' do
    it 'calculates total price of items and coverts to dollars' do
      ideal = Supermarket.create!(name: 'Ideal Market', location: 'Capitol Hill')
      mike = Customer.create!(name: "Mike", supermarket_id: ideal.id)
      banana = Item.create!(name: 'Banana', price: 200)
      bread = Item.create!(name: 'Bread', price: 600)
      CustomerItem.create!(customer_id: mike.id, item_id: banana.id)
      CustomerItem.create!(customer_id: mike.id, item_id: bread.id)

      expect(mike.total_price).to eq(800)
    end
  end
end