class Cart < ActiveRecord::Base
  has_many  :line_items, :dependent => :destroy

  def add_product(product_id)
    product = Product.find_by_id(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id, :price => product.price, :quantity => 1)
    end
    current_item
  end

  def decrement_quantity(line_id)
    line = line_items.find line_id
    if (line)
      line.quantity = line.quantity - 1
      if (line.quantity > 0)
        line.save
      else
        line.destroy
      end
    end
    line
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    line_items.sum(:quantity)
  end
end
