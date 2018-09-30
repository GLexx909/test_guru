class ApplicationController < ActionController::Base

  helper_method :current_user,
                :user_signed_in?

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Verify your entered data'
      cookies_path(request.fullpath) 
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def cookies_path(path)
    cookies[:path] = path
  end

end
