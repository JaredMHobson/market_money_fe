class VendorFacade
  attr_reader :vendor

  def initialize(id: nil)
    @service = MarketService.new
    @id = id
    @vendor ||= find_vendor
  end

  def find_vendor
    if @id
      vendor_data = @service.get_vendor(@id)

      Vendor.new(format_vendor_data(vendor_data))
    end
  end

  private

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
