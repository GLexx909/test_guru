class ApplicationController < ActionController::Base

  protected

   def after_sign_in_path_for(resource)
     # signed_in_root_path(resource)
     if resource.is_a?(Admin)
       admin_tests_path
     else
       super
     end

   end

end
