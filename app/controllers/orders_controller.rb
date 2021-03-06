class OrdersController < ApplicationController
  def checkout
    @order = current_client.orders.waiting_payment.last
    @payment_options = PaymentOption.all(@order.order_value)
    @order.waiting_payment!
    @api = 'https://localhost:4000/api/pagamentos'
  end

  def confirm
    order = current_client.orders.find_by(status: :pending)
    order.waiting_payment!
    redirect_to checkout_path
  end

  def payment; end
end
