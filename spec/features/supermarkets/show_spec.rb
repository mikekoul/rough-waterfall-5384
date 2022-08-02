require 'rails_helper'

RSpec.describe 'supermarket show page' do
  describe '#show' do
    it 'displays the name of the supermarket' do
      ideal = Supermarket.create!(name: 'Ideal Market', location: 'Capitol Hill')
      soopers = Supermarket.create!(name: 'King Soopers', location: 'Aurora')

      visit "/supermarkets/#{ideal.id}"

      expect(page).to have_content("Ideal Market")
      expect(page).to_not have_content("King Soopers")
    end

    it 'has a link to view all the items belonging to the supermarket' do
      ideal = Supermarket.create!(name: 'Ideal Market', location: 'Capitol Hill')
      soopers = Supermarket.create!(name: 'King Soopers', location: 'Aurora')

      visit "/supermarkets/#{ideal.id}"

      expect(page).to have_link("All Items")
      expect(page).to_not have_content("King Soopers")
    end

    it 'click link and redirected to the supermarkets item index page' do
      ideal = Supermarket.create!(name: 'Ideal Market', location: 'Capitol Hill')
      soopers = Supermarket.create!(name: 'King Soopers', location: 'Aurora')

      visit "/supermarkets/#{ideal.id}"

      click_link ("All Items")

      expect(current_path).to eq("/supermarkets/#{ideal.id}/items")
    end
  end
end