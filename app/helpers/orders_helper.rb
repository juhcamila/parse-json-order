module OrdersHelper
  def create_payload_order(result)
    return {
        id: result.id,
        storeId: result.store_id,
        subTotal:  result.total_amount,
        deliveryFee: result.total_shipping,
        total_shipping: 5.14,
        total: 61.90,
        country: BR,
        state: SP,
        city: Cidade de Testes,
        district: Bairro Fake,
        street: Rua de Testes Fake,
        complement: galpao,
        latitude: -23.629037,
        longitude:  -46.712689,
        dtOrderCreate: 2019-06-27T19:59:08.251Z,
        postalCode: 85045020,
        number: 0,
    }
  end
end
