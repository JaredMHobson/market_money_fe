require 'rails_helper'

RSpec.describe 'Vendor Facade' do
  it 'exists and creates a Market Service on intialization' do
    facade = VendorFacade.new

    expect(facade).to be_a VendorFacade
    expect(facade.instance_variable_get(:@service)).to be_a MarketService
  end

  it 'calls on the find_vendor method and stores it in state with @vendor when initialized with a Vendor ID' do
    facade = VendorFacade.new(id: 54924)

    expect(facade.vendor).to be_a Vendor
  end

  describe '#instance_methods' do
    describe '#find_vendor' do
      it 'returns a Vendor if the VendorFacade is initalized with a Vendor ID' do
        facade = VendorFacade.new(id: 54924)

        vendor = facade.find_vendor

        expect(vendor).to be_a Vendor
      end
    end
  end
end
