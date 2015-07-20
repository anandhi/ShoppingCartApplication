require_relative '../lib/base_model'
require_relative '../catalog/product'

class Order < BaseModel
  attr_accessor :user_id, :amount, :items

  def initialize(user_id)
    super()
    self.user_id = user_id
    self.amount = 0
    self.items = []
    self.persist
  end

  def add_item(product_id)
    product = Product.find(product_id)
    self.amount += product["price"].to_i
    self.items << product
    self.persist
  end
end