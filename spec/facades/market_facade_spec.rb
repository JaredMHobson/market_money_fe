require 'rails_helper'

RSpec.describe 'Market Facade' do
  it 'exists and creates a Market Service on intialization' do
    facade = MarketFacade.new

    expect(facade).to be_a MarketFacade
    expect(facade.instance_variable_get(:@service)).to be_a MarketService
  end

  describe '#instance_methods' do
    describe '#markets' do
      it 'takes market data from the service method get markets and returns an array of Market poros' do
        facade = MarketFacade.new

        markets = facade.markets[0..9]

        markets.each do |market|
          expect(market).to be_a Market
        end
      end
    end
  end
end
