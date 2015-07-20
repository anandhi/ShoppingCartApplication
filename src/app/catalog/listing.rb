require_relative '../lib/base_model'
require_relative '../catalog/product'

class Listing < BaseModel
  attr_accessor :seller_id, :product

  def initialize(seller_id, product_name, product_price)
    super()
    self.seller_id = seller_id
    self.product = Product.new(product_name, product_price)
    self.persist
  end

end