require_relative '../../src/app/catalog/seller'
require_relative '../../src/app/catalog/listing'
require_relative '../../src/app/user_mgmt/user'
require_relative '../../src/app/order_mgmt/cart'
require_relative '../../src/app/services/order_service'
require_relative '../../src/app/services/payment_service'

class ShoppingCartApplication
  def initialize
    seller = Seller.new('Anand', 'abc@xyz.com')
    listing_one = Listing.new(seller.id, "Book", 230)
    listing_two = Listing.new(seller.id, "Mobile", 12230)

    user_one = User.new('Sachin', '709709770987')
    user_two = User.new('Arun', '8909770987')


    cart_of_user_one = Cart.new(user_one.id)
    cart_of_user_one.add_to_cart(listing_one.product.id)
    cart_of_user_one.add_to_cart(listing_one.product.id)

    order = OrderService.create_order(cart_of_user_one)
    payment = PaymentService.make_payment('CreditCard', '498263918269', order)
    p payment.to_json
  end
end

ShoppingCartApplication.new