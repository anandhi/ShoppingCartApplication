require_relative '../lib/base_model'

class Product < BaseModel
  attr_accessor :name, :price

  def initialize(name, price)
    super()
    self.name = name
    self.price = price
    self.persist
  end

end