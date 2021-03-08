module PaymentsHelper
  def create_payload_payment(payment, order_id)
    {
      payment_type: payment["payment_type"],
      value: payment["total_paid_amount"],
      order_id: order_id
    }
  end
end
