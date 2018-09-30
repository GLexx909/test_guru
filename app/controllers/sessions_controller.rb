class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      cookies[:path] ? (redirect_to cookies[:path]) : (redirect_to tests_path)
    else
      flash.now[:alert] = 'Verify your entered data'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
