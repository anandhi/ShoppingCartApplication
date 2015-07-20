require_relative '../lib/base_model'

class Cart < BaseModel
  attr_accessor :user_id, :cart_items

  def initialize(user_id)
    super()
    self.user_id = user_id
    self.cart_items = []
    self.persist
  end

  def add_to_cart(product_id)

    self.cart_items << Product.find(product_id)
    self.persist
    self
  end
end