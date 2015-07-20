require_relative '../lib/base_model'
class ContactInfo < BaseModel
  attr_accessor :contact_type, :contact_value

  def initialize(type, value)
    self.contact_type = type
    self.contact_value = value
  end

end