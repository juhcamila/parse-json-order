module OrdersHelper
  def create_payload_order(result)
    address = result["shipping"]["receiver_address"]

    {
      externalCode: result["id"],
      storeId: result["store_id"],
      subTotal: result["total_amount"],
      deliveryFee: result["total_shipping"],
      total_shipping: result["total_shipping"],
      total: result["total_amount_with_shipping"],
      country: address["country"]["id"],
      state: address["state"]["name"],
      city: address["city"]["name"],
      district: address["neighborhood"]["name"],
      street: address["street_name"],
      complement: address["comment"],
      latitude: address["latitude"],
      longitude: address["longitude"],
      dtOrderCreate: result["date_created"],
      postalCode: address["zip_code"],
      number: address["street_number"]
    }
  end

  def create_payload_request(order)
    parse_order = JSON.parse(order.to_json)
    parse_order.to_h.delete("id")

    if order.customer
      parse_order["customer"] = JSON.parse(order.customer.to_json)
      parse_order["customer"].delete(:id)
      parse_order["customer"].delete(:order_id)
    end

    parse_order["items"] = []
    order.items.each do |item|
      format_item = JSON.parse(item.to_json)
      format_item.to_h.delete("id")
      format_item.to_h.delete("order_id")
      format_item["subItems"] = []

      parse_order["items"] << format_item
    end

    parse_order["payments"] = []
    order.payments.each do |payment|
      format_payment = {
        "type" => payment.payment_type,
        "value" => payment.value
      }
      parse_order["payments"] << format_payment
    end

    parse_order.to_json
  end
end
