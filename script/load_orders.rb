Order.transaction do
  products = Product.all
  num_products = products.size

  (1..100).each do |i|
    order = Order.new(name: "Customer #{i}", address: "#{i} Main Street", email: "customer-#{i}@example.com", pay_type: "Check")
    product = products[(i-1) % num_products]
    line_item = order.line_items.build(:product_id => product.id, :price => product.price, :quantity => 1)
    order.line_items << line_item
    order.save
  end
end