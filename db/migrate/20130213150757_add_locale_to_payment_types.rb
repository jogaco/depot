class AddLocaleToPaymentTypes < ActiveRecord::Migration
  def up
    add_column :payment_types, :locale, :string
    add_column :payment_types, :description, :string
    PaymentType.all.each do |type|
      type.locale = 'en'
      type.save!
    end
    type = PaymentType.find_by_name('Check')
    type.locale = 'en'
    type.description = 'Check'
    type.save
    type = PaymentType.find_by_name('Credit Card')
    type.locale = 'en'
    type.description = 'Credit Card'
    type.save
    type = PaymentType.find_by_name('Credit Card')
    type.locale = 'en'
    type.description = 'Credit Card'
    type.save
    type = PaymentType.find_by_name('Purchase Order')
    type.locale = 'en'
    type.description = 'Purchase Order'
    type.save
    type = PaymentType.find_by_name('Paypal')
    type.locale = 'en'
    type.description = 'Paypal'
    type.save

    PaymentType.create!(:name => 'Check', :locale => 'es', :description => 'Cheque')
    PaymentType.create!(:name => 'Credit Card', :locale => 'es', :description => 'Tarjeta de Credito')
    PaymentType.create!(:name => 'Purchase Order', :locale => 'es', :description => 'Orden de Compra')
    PaymentType.create!(:name => 'Paypal', :locale => 'es', :description => 'Paypal')
  end
  def down
    remove_column :payment_types, :locale
    remove_column :payment_types, :description
  end
end
