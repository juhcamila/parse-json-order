module CustomersHelper
  def create_payload_customer(buyer)
    binding.pry
    name = buyer["first_name"].concat(" #{buyer["last_name"]}")
    contact = buyer["phone"]["area_code"].to_s.concat(buyer["phone"]["number"])
    {
      externalCode: buyer["id"],
      name: name,
      email: buyer["email"],
      contact: contact
    }
  end
end
