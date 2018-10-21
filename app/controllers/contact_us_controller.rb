class ContactUsController < ApplicationController

  def show_form
  end

  def send_mail
    message = params[:body]
    user = current_user

    ContactUsMailer.send_mail(user, message).deliver_now
    redirect_to tests_path, notice: t('.success')
  end

end
