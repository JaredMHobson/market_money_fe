class Market
  attr_reader :id,
              :name,
              :street,
              :city,
              :state,
              :zip

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @street = attributes[:street]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
  end

  def city_state_zip
    "#{@city}, #{@state} #{@zip}"
  end
end
