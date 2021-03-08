module ItemsHelper

  def create_payload_item(item, order_id)
    {
      externalCode: item["item"]["id"],
      name: item["item"]["title"],
      price: item["unit_price"],
      quantity: item["quantity"],
      total: item["full_unit_price"],
      order_id: order_id
    }
  end
end
