class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  private
    def set_locale
      I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end


    def default_url_options(options = {})
      { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale  }
    end


  protected
    def configure_permitted_parameters
      attributes = [:first_name, :last_name, :email, :avatar, :password, :password_confirmation, :current_password]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end
