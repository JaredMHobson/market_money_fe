class MarketFacade
  def initialize
    @service = MarketService.new
  end

  def markets
    @markets ||= (
      markets_data = @service.get_markets
      markets_data.map do |market_data|
        Market.new(format_market_data(market_data))
      end
    )
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
end
