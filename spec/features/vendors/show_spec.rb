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
end
