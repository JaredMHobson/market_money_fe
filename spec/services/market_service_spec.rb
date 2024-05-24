require 'rails_helper'

RSpec.describe 'Market Service' do
  it 'exists' do
    service = MarketService.new

    expect(service).to be_a MarketService
  end

  describe '#instance_methods' do
    describe '#get_markets' do
      it 'returns an array of market data' do
        market_data = MarketService.new.get_markets[0..9]

        market_data.each do |market|
          expect(market).to have_key(:id)
          expect(market[:id]).to be_a String

          expect(market).to have_key(:type)
          expect(market[:type]).to eq('market')

          expect(market).to have_key(:relationships)
          expect(market[:relationships]).to be_a Hash

          expect(market[:relationships]).to have_key(:vendors)
          expect(market[:relationships][:vendors]).to be_a Hash

          expect(market).to have_key(:attributes)
          expect(market[:attributes]).to be_a Hash

          expect(market[:attributes]).to have_key(:name)
          expect(market[:attributes][:name]).to be_a String

          expect(market[:attributes]).to have_key(:street)
          expect(market[:attributes][:street]).to be_a String

          expect(market[:attributes]).to have_key(:city)
          expect(market[:attributes][:city]).to be_a String

          expect(market[:attributes]).to have_key(:county)
          expect(market[:attributes][:county]).to be_a String

          expect(market[:attributes]).to have_key(:state)
          expect(market[:attributes][:state]).to be_a String

          expect(market[:attributes]).to have_key(:zip)
          expect(market[:attributes][:zip]).to be_a String

          expect(market[:attributes]).to have_key(:lat)
          expect(market[:attributes][:lat]).to be_a String

          expect(market[:attributes]).to have_key(:lon)
          expect(market[:attributes][:lon]).to be_a String

          expect(market[:attributes]).to have_key(:vendor_count)
          expect(market[:attributes][:vendor_count]).to be_a Integer
        end
      end
    end

    describe '#get_market' do
      it 'returns a single markets data whose ID is passed through the argument' do
        market = MarketService.new.get_market(322458)

        expect(market).to have_key(:id)
        expect(market[:id]).to be_a String

        expect(market).to have_key(:type)
        expect(market[:type]).to eq('market')

        expect(market).to have_key(:relationships)
        expect(market[:relationships]).to be_a Hash

        expect(market[:relationships]).to have_key(:vendors)
        expect(market[:relationships][:vendors]).to be_a Hash

        expect(market).to have_key(:attributes)
        expect(market[:attributes]).to be_a Hash

        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_a String

        expect(market[:attributes]).to have_key(:street)
        expect(market[:attributes][:street]).to be_a String

        expect(market[:attributes]).to have_key(:city)
        expect(market[:attributes][:city]).to be_a String

        expect(market[:attributes]).to have_key(:county)
        expect(market[:attributes][:county]).to be_a String

        expect(market[:attributes]).to have_key(:state)
        expect(market[:attributes][:state]).to be_a String

        expect(market[:attributes]).to have_key(:zip)
        expect(market[:attributes][:zip]).to be_a String

        expect(market[:attributes]).to have_key(:lat)
        expect(market[:attributes][:lat]).to be_a String

        expect(market[:attributes]).to have_key(:lon)
        expect(market[:attributes][:lon]).to be_a String

        expect(market[:attributes]).to have_key(:vendor_count)
        expect(market[:attributes][:vendor_count]).to be_a Integer
      end
    end

    describe '#get_market_vendors' do
      it 'returns an array of vendor data that belong to the market whose ID is passed through the argument' do
        vendors = MarketService.new.get_market_vendors(322458)

        vendors.each do |vendor|
          expect(vendor).to have_key(:id)
          expect(vendor[:id]).to be_a String

          expect(vendor).to have_key(:type)
          expect(vendor[:type]).to eq('vendor')

          expect(vendor).to have_key(:relationships)
          expect(vendor[:relationships]).to be_a Hash

          expect(vendor[:relationships]).to have_key(:markets)
          expect(vendor[:relationships][:markets]).to be_a Hash

          expect(vendor).to have_key(:attributes)
          expect(vendor[:attributes]).to be_a Hash

          expect(vendor[:attributes]).to have_key(:name)
          expect(vendor[:attributes][:name]).to be_a String

          expect(vendor[:attributes]).to have_key(:description)
          expect(vendor[:attributes][:description]).to be_a String

          expect(vendor[:attributes]).to have_key(:contact_name)
          expect(vendor[:attributes][:contact_name]).to be_a String

          expect(vendor[:attributes]).to have_key(:contact_phone)
          expect(vendor[:attributes][:contact_phone]).to be_a String

          expect(vendor[:attributes]).to have_key(:credit_accepted)
          expect(vendor[:attributes][:credit_accepted]).to be_in([true, false])
        end
      end
    end

    describe '#get_market' do
      it 'returns a single vendors data whose ID is passed through the argument' do
        vendor = MarketService.new.get_vendor(54924)

        expect(vendor).to have_key(:id)
        expect(vendor[:id]).to be_a String

        expect(vendor).to have_key(:type)
        expect(vendor[:type]).to eq('vendor')

        expect(vendor).to have_key(:relationships)
        expect(vendor[:relationships]).to be_a Hash

        expect(vendor[:relationships]).to have_key(:markets)
        expect(vendor[:relationships][:markets]).to be_a Hash

        expect(vendor).to have_key(:attributes)
        expect(vendor[:attributes]).to be_a Hash

        expect(vendor[:attributes]).to have_key(:name)
        expect(vendor[:attributes][:name]).to be_a String

        expect(vendor[:attributes]).to have_key(:description)
        expect(vendor[:attributes][:description]).to be_a String

        expect(vendor[:attributes]).to have_key(:contact_name)
        expect(vendor[:attributes][:contact_name]).to be_a String

        expect(vendor[:attributes]).to have_key(:contact_phone)
        expect(vendor[:attributes][:contact_phone]).to be_a String

        expect(vendor[:attributes]).to have_key(:credit_accepted)
        expect(vendor[:attributes][:credit_accepted]).to be_in([true, false])
      end
    end

    describe '#get_search_markets' do
      it 'returns an array of market data that contains the passed argument name, city and state. These arguments are optional' do
        search_params = {
          city: 'Alexandria',
          state: 'Virginia'
        }

        market_data = MarketService.new.get_search_markets(search_params)

        market_data.each do |market|
          expect(market).to have_key(:id)
          expect(market[:id]).to be_a String

          expect(market).to have_key(:type)
          expect(market[:type]).to eq('market')

          expect(market).to have_key(:relationships)
          expect(market[:relationships]).to be_a Hash

          expect(market[:relationships]).to have_key(:vendors)
          expect(market[:relationships][:vendors]).to be_a Hash

          expect(market).to have_key(:attributes)
          expect(market[:attributes]).to be_a Hash

          expect(market[:attributes]).to have_key(:name)
          expect(market[:attributes][:name]).to be_a String

          expect(market[:attributes]).to have_key(:street)
          expect(market[:attributes][:street]).to be_a String

          expect(market[:attributes]).to have_key(:city)
          expect(market[:attributes][:city]).to be_a String

          expect(market[:attributes]).to have_key(:county)
          expect(market[:attributes][:county]).to be_a String

          expect(market[:attributes]).to have_key(:state)
          expect(market[:attributes][:state]).to be_a String

          expect(market[:attributes]).to have_key(:zip)
          expect(market[:attributes][:zip]).to be_a String

          expect(market[:attributes]).to have_key(:lat)
          expect(market[:attributes][:lat]).to be_a String

          expect(market[:attributes]).to have_key(:lon)
          expect(market[:attributes][:lon]).to be_a String

          expect(market[:attributes]).to have_key(:vendor_count)
          expect(market[:attributes][:vendor_count]).to be_a Integer
        end
      end
    end

    describe '#get_url' do
      it 'consumes the argument API endpoint and parses the returned JSON into a hash' do
        response = MarketService.new.get_url('markets')

        expect(response).to be_a Hash

        expect(response).to have_key(:data)
        expect(response[:data]).to be_a Array
      end
    end

    describe '#conn' do
      it 'initializes a new Faraday connection ' do
        connection = MarketService.new.conn

        expect(connection).to be_a Faraday::Connection
      end
    end
  end
end
