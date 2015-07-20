require_relative '../lib/base_model'

class Seller < BaseModel
  attr_accessor :name, :email_id

  def initialize(name, email_id)
    super()
    self.name = name
    self.email_id = email_id
  end

end