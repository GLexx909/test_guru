class ApplicationController < ActionController::Base

  before_action :configure_sign_up_and_account_update_params, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    { locale: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  protected

   def after_sign_in_path_for(resource)
     if resource.admin?
       admin_tests_path
     else
       super
     end

   end

   def configure_sign_up_and_account_update_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name])
   end

   def set_locale
     I18n.locale = I18n.locale_available?(params[:locale]) ? params[:locale] : I18n.default_locale
   end

end
