class AddPriceToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :price, :decimal, :precision => 8, :scale => 2
begin
    LineItem.where("price is null").each do |line_item|
      if line_item.product != nil
        line_item.price = line_item.product.price
        line_item.save
      end
    end
end

  end

  def self.down
     remove_column :line_items, :price
  end
end
