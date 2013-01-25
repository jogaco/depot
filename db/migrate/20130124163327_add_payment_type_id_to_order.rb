class AddPaymentTypeIdToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :payment_type_id, :integer
    Order.all.each do |order|
      payment_type = PaymentType.find_by_name(order.pay_type)
      order.payment_type = payment_type
      order.save
    end
  end

  def down
    Order.all.each do |order|
      payment_type = PaymentType.find(order.payment_type.id)
      order.pay_type = payment_type.name
      order.save
    end
    remove_column :orders, :payment_type_id
  end
end
