class MarketService
  def get_markets
    get_url('markets')[:data]
  end

  def get_market(market_id)
    get_url("markets/#{market_id}")[:data]
  end

  def get_market_vendors(market_id)
    get_url("markets/#{market_id}/vendors")[:data]
  end

  def get_vendor(vendor_id)
    get_url("vendors/#{vendor_id}")[:data]
  end

  def get_search_markets(search)
    get_url("markets/search?name=#{search[:name]}&city=#{search[:city]}&state=#{search[:state]}")[:data]
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://localhost:3000/api/v0/")
  end
end
