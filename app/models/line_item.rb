class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity, :price

  belongs_to :product
  belongs_to :cart

  def total_price
    begin
      price * quantity
    rescue ActiveRecord::FieldError
      product.price * quantity
    end
  end
end
