require 'rails_helper'

RSpec.describe 'Vendor' do
  before(:each) do
    vendor_data = {
      id: '5',
      name: 'Vendor Name',
      description: 'Vendor Description',
      contact_name: 'Vendor Owner',
      contact_phone: '(123)456-7890',
      credit_accepted: true
    }

    @vendor = Vendor.new(vendor_data)
  end

  it 'exists and has attributes' do
    expect(@vendor).to be_a Vendor
    expect(@vendor.name).to eq('Vendor Name')
    expect(@vendor.description).to eq('Vendor Description')
    expect(@vendor.contact_name).to eq('Vendor Owner')
    expect(@vendor.contact_phone).to eq('(123)456-7890')
    expect(@vendor.credit_accepted).to eq(true)
  end

  describe '#instance_methods' do
    describe '#credit_accepted_yesno' do
      it 'returns YES if credit is accepted and NO otherwise' do
        vendor_data = {
          id: '6',
          name: 'Vendor Name',
          description: 'Vendor Description',
          contact_name: 'Vendor Owner',
          contact_phone: '(123)456-7890',
          credit_accepted: false
        }

        false_vendor = Vendor.new(vendor_data)

        expect(@vendor.credit_accepted_yesno).to eq('YES')
        expect(false_vendor.credit_accepted_yesno).to eq('NO')
      end
    end
  end
end
