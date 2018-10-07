# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    flash[:notice] = "Hello #{current_user.name}" #Наверное может в sessions_helper можно вынести (видоизменив) и во вьюзу засунуть, но его(хелпера) нет. Как правильно?
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # protected
  #
  #  def after_sign_in_path_for(resource)
  #    # signed_in_root_path(resource)
  #    if resource.is_a?(Admin)
  #      admin_tests_path
  #    else
  #      super
  #    end
  #
  #  end

end
