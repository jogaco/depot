class CreatePaymentTypes < ActiveRecord::Migration
  def up
    create_table :payment_types do |t|
      t.string :name

      t.timestamps
    end
    PaymentType.create(:name => 'Check')
    PaymentType.create(:name => 'Credit Card')
    PaymentType.create(:name => 'Purchase Order')
    PaymentType.create(:name => 'Paypal')
  end

  def down
    drop_table :payment_types
  end
end
