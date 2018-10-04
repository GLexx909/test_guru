class ApplicationController < ActionController::Base

  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  protected

   def after_sign_in_path_for(resource)
     # signed_in_root_path(resource)
     if resource.admin?
       admin_tests_path
     else
       super
     end

   end

   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
   end

   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name])
   end

end
