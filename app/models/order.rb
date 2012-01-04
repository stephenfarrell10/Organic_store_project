class Order < ActiveRecord::Base
has_many :line_items,dependent: :destroy



  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]


  validates_length_of :name, :minimum => 3
   validates_length_of :address, :minimum => 10
# @reference sam ruby, dave thomas, david heinemeier hanson, agile web development,page 159, chapter 12,fourth edition
validates :name, :address, presence: true
 validates :payment, inclusion: PAYMENT_TYPES


 #@reference sam ruby, dave thomas, david heinemeier hanson, agile web development, page 162, chapter12
  def add_line_items_from_cart(cart)
 cart.line_items.each do |item|
  item.cart_id = nil
 line_items << item
 end
  end

   end