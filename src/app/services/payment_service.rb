require_relative '../../../src/app/order_mgmt/payment'

class PaymentService

  def self.make_payment(payment_method, payment_details, order)
    Payment.new(payment_method, payment_details, order.id)
  end
end