class ApplicationController < ActionController::Base
  before_filter :authorize, :set_i18n_locale_from_params
  protect_from_forgery

  protected
    def authorize
      if request.format == Mime::HTML
        unless User.find_by_id(session[:user_id])
          redirect_to login_path, notice: 'Please log in'
        end
      else
        authenticate_or_request_with_http_basic('Administration') do |username, password|
          user = User.find_by_name(username)
          user and user.authenticate(password)
        end
      end
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
              "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

  def default_url_options
    { locale: I18n.locale }
  end

  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
