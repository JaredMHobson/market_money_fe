class MarketService
  def get_markets
    get_url('markets')[:data]
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://localhost:3000/api/v0/")
  end
end
