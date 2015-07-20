require_relative '../lib/base_model'
require_relative '../../../src/app/order_mgmt/order'

class Payment < BaseModel
  attr_accessor :payment_method, :payment_details, :user_id, :amount, :order_id

  def initialize(method, details, order_id)
    super()
    self.payment_method = method
    self.payment_details = details
    order = Order.find(order_id)
    p order
    self.amount = order["amount"]
    self.order_id = order_id
    self.user_id = order["user_id"]
    self.persist
  end
end