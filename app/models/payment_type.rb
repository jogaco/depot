class PaymentType < ActiveRecord::Base
  attr_accessible :name, :locale, :description

  validates :name,
            presence: true,
            uniqueness: { :scope => :locale }
end
