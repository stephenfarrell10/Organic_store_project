class Cart < ActiveRecord::Base

  has_many :line_items, dependent: :destroy






  #@reference wesley gorman laptop_shop 3 tutorial step 29
  def add_product(product)
    current_item = line_items.where(:product_id => product.id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id => product.id)
      line_items << current_item
    end
    current_item
  end
#@reference wesley gorman laptop_shop 3 tutorial,step2
   def total_price
total = 0
line_items.each do |line_item|
total += line_item.product.price * line_item.quantity
end
total

  end
end


