module CartsHelper
  def number_to_currency_locale(num)
    if I18n.locale.to_s == 'es'
      number_to_currency(num / 1.3, )
    else
      number_to_currency(num)
    end
  end
end
