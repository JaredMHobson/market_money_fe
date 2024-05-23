require 'rails_helper'

RSpec.describe 'Markets Index Page', type: :feature do
  it 'lists all markets with their name, city and state' do
    visit markets_path

    within '#markets_table' do
      expect(page).to have_selector('th', text: 'Name')
      expect(page).to have_selector('th', text: 'City')
      expect(page).to have_selector('th', text: 'State')

      within '#market_322458_info' do
        expect(page).to have_selector('td', text: "14&U Farmers' Market")
        expect(page).to have_selector('td', text: "Washington")
        expect(page).to have_selector('td', text: "District of Columbia")
      end

      within '#market_322474_info' do
        expect(page).to have_selector('td', text: "2nd Street Farmers' Market")
        expect(page).to have_selector('td', text: "Amherst")
        expect(page).to have_selector('td', text: "Virginia")
        expect(page).to have_button('More Info')
      end
    end
  end
end
