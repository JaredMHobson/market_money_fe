class Vendor
  attr_reader :id,
              :name,
              :description,
              :contact_name,
              :contact_phone,
              :credit_accepted

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @description = attributes[:description]
    @contact_name = attributes[:contact_name]
    @contact_phone = attributes[:contact_phone]
    @credit_accepted = attributes[:credit_accepted]
  end
end
