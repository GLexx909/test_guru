class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
      puts "hello"
      puts cookies[:email]
    else
      flash.now[:alert] = 'Verify your entered data'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    #session.clear или
    #reset_session ?
    redirect_to login_path
  end

end
