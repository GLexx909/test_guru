class ContactUsMailer < ApplicationMailer

  def send_mail(user, message)
    @user = user
    @message = message

    mail to: 'glexx909@gmail.com', from: user.email
  end

end
