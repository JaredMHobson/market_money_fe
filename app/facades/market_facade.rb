class MarketFacade
  attr_reader :market

  def initialize(id: nil, search_params: nil)
    @service = MarketService.new
    @id = id
    @search_params = search_params
    @market ||= find_market
  end

  def find_market
    if @id
      market_data = @service.get_market(@id)

      Market.new(format_market_data(market_data))
    end
  end

  def markets
    @markets ||= (
      markets_data = @service.get_markets

      markets_data.map do |market_data|
        Market.new(format_market_data(market_data))
      end
    )
  end

  def market_vendors
    @vendors ||= (
      vendors_data = @service.get_market_vendors(@id)

      vendors_data.map do |vendor_data|
        Vendor.new(format_vendor_data(vendor_data))
      end
    )
  end

  def search_markets
    # @search_markets ||= (
    if @search_params
        markets_data = @service.get_search_markets(@search_params)

        markets_data.map do |market_data|
        Market.new(format_market_data(market_data))
      end
    end
    # )
  end

  private
  def format_market_data(data)
    {
      id: data[:id],
      name: data[:attributes][:name],
      street: data[:attributes][:street],
      city: data[:attributes][:city],
      state: data[:attributes][:state],
      zip: data[:attributes][:zip]
  }
  end

  def format_vendor_data(data)
    {
      id: data[:id],
      name: data[:attributes][:name],
      description: data[:attributes][:description],
      contact_name: data[:attributes][:contact_name],
      contact_phone: data[:attributes][:contact_phone],
      credit_accepted: data[:attributes][:credit_accepted]
  }
  end
end
