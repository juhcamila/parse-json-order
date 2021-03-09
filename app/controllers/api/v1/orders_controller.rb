class Api::V1::OrdersController < ApplicationController

  def create
    binding.pry
    save_data
    unless @data.empty?
      return render json: {status: 'ERROR', message: 'An error occurred while saving the data', data: @data.errors }, status: :unprocessable_entity
    end

    payload_request = create_payload_request(@order)
    d = Time.now
    date = (d.strftime("%Ih%M") +  d.strftime(" - %m/%d/%Y"))
    url = "https://delivery-center-recruitment-ap.herokuapp.com/"

    response =
      RestClient.post(
        url,
        payload_request,
        headers: { "X-sent": date, "Content-Type": "application/json" }
      )

    unless response.body == "OK"
      return render json: {status: 'ERROR', message: 'An error occurred while saving the data', data: response.body }, status: :unprocessable_entity
    end
    render json: {status: 'Success', message:'Concluded'}, status: :ok
  end

  def save_data
    @data = []
    ActiveRecord::Base.transaction do
      payload_customer = create_payload_customer(params["buyer"])
      customer = Customer.create(payload_customer)
      unless customer.errors.empty?
        @data = customer.errors
        raise ActiveRecord::Rollback
      end

      payload_order = create_payload_order(params)
      payload_order[:customer_id] = customer.id
      @order = Order.create(payload_order)
      unless @order.errors.empty?
        @data = @order.errors
        raise ActiveRecord::Rollback
      end

      params["order_items"].each do |item|
        created_item = Item.create(create_payload_item(item, @order.id))
        unless created_item.errors.empty?
          @data = created_item.errors
          raise ActiveRecord::Rollback
        end
      end

      params["payments"].each do |payment|
        created_payment = Payment.create(create_payload_payment(payment, @order.id))
        unless created_payment.errors.empty?
          @data = created_payment.errors
          raise ActiveRecord::Rollback
        end
      end
    end
  end
end
