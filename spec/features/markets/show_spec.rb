require 'rails_helper'

RSpec.describe 'Market Show Page', type: :feature do
  it 'lists all markets with their name, city and state' do
    visit market_path(322458)

    expect(page).to have_content("14&U Farmers' Market")
    expect(page).to have_content("1400 U Street NW")
    expect(page).to have_content("Washington, District of Columbia 20009")

    within '#market_vendors_list' do
      expect(page).to have_link('The Charcuterie Corner', href: vendor_path(55823))
    end
  end
end
