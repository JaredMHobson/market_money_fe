require 'rails_helper'

RSpec.describe 'Market' do
  before(:each) do
    market_data = {
      id: '12',
      name: 'Market Name',
      street: 'Market Street',
      city: 'Market City',
      state: 'Market State',
      zip: 'Market Zip'
    }

    @market = Market.new(market_data)
  end

  it 'exists and has attributes' do
    expect(@market).to be_a Market
    expect(@market.name).to eq('Market Name')
    expect(@market.street).to eq('Market Street')
    expect(@market.city).to eq('Market City')
    expect(@market.state).to eq('Market State')
    expect(@market.zip).to eq('Market Zip')
  end

  describe '#instance_methods' do
    describe '#city_state_zip' do
      it 'combines the city, state and zip and returns it as one string' do
        expect(@market.city_state_zip).to eq('Market City, Market State Market Zip')
      end
    end
  end
end
