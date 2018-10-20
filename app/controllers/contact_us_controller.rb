class ContactUsController < ApplicationController

  def show_form
  end

  def send_mail
    message = params[:body]
    user = current_user

    if ContactUsMailer.send_mail(user, message).deliver_now #Такая схема не работает, конечно)))) Всмысле в случае ошибки.
      redirect_to tests_path
      flash[:notice] = t('.success')
    else
      render 'show_form'
      flash[:alert] = t('.failure')
    end
  end

end
