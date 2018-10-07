class ApplicationController < ActionController::Base

  before_action :configure_sign_up_and_account_update_params, if: :devise_controller?

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

end
