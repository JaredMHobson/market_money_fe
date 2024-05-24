require 'rails_helper'

RSpec.describe 'Vendor Show Page', type: :feature do
  it 'shows a vendors info including their name, contact info, whether they accept credit and a description of what they sell' do
    visit vendor_path(54924)

    within '#vendor_info' do
      expect(page).to have_content("CHZ PLZ")
      expect(page).to have_content("Name: Verna Goodwin Ret.")
      expect(page).to have_content("Phone: 595-100-6344")
      expect(page).to have_content("Credit Accepted?: YES")
      expect(page).to have_content("Description: This vendor offers a variety of artisanal cheeses.")
    end
  end

  it 'can search for markets and each market name will link to its show page' do
    visit vendor_path(54924)

    within '#market_search' do
      expect(page).to have_field(:name)
      expect(page).to have_field(:city)
      expect(page).to have_field(:state)

      fill_in(:city, with: 'Alexandria')
      fill_in(:state, with: 'Virginia')
      click_on('Search')
    end

      expect(current_path).to eq(vendor_path(54924))

    within '#market_search_results' do
      expect(page).to have_link("Del Ray Farmers' Market", href: market_path(324298))
      expect(page).to have_link("King Street Station Farmers' Market", href: market_path(326482))
    end
  end
end
