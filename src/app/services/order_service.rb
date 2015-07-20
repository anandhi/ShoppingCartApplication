require_relative '../order_mgmt/cart'
require_relative '../order_mgmt/order'

class OrderService

  def self.create_order(cart)
    order = Order.new(cart.user_id)
    cart.cart_items.each do |cart_item|
      order.add_item(cart_item["id"])
    end
    order
  end

end