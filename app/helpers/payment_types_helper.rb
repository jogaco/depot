module PaymentTypesHelper
  def all_payment_for_locale
    PaymentType.find_all_by_locale(I18n.locale)
  end
end
