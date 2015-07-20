require_relative '../lib/base_model'
require_relative '../user_mgmt/contact_info'
class User < BaseModel

  attr_accessor :name, :phone_number, :contact_info

  def initialize(name, phone_number)
    super()
    self.name = name
    self.contact_info = ContactInfo.new('Phone', phone_number)
    self.persist
  end
end