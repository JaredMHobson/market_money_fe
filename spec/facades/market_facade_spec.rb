require 'rails_helper'

RSpec.describe 'Market Facade' do
  it 'exists and creates a Market Service on intialization' do
    facade = MarketFacade.new

    expect(facade).to be_a MarketFacade
    expect(facade.instance_variable_get(:@service)).to be_a MarketService
  end

  it 'calls on the find_market method and stores it in state with @market when initialized with a Market ID' do
    facade = MarketFacade.new(id: 322458)

    expect(facade.market).to be_a Market
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

    describe '#find_market' do
      it 'returns a Market if the MarketFacade is initalized with a Market ID' do
        facade = MarketFacade.new(id: 322458)

        market = facade.find_market

        expect(market).to be_a Market
      end
    end

    describe '#market_vendors' do
      it 'returns an array of Vendors that belong to the market if the MarketFacade is initialized with a Market ID' do
        facade = MarketFacade.new(id: 322458)

        vendors = facade.market_vendors

        vendors.each do |vendor|
          expect(vendor).to be_a Vendor
        end
      end
    end

    describe 'search_markets' do
      it 'returns an array of Markets that meet the search params passed in when initialized' do
        search_params = {
          city: 'Alexandria',
          state: 'Virginia'
        }

        facade = MarketFacade.new(search_params: search_params)

        markets = facade.search_markets

        markets.each do |market|
          expect(market).to be_a Market
        end
      end
    end
  end
end
