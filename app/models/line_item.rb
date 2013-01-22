class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity, :price

  belongs_to :product
  belongs_to :cart

  def total_price
    begin
      # get price from the line: safer because product price could change after the order
      price * quantity
    rescue ActiveRecord::FieldError
      product.price * quantity
    end
  end
end
