class ContactUsMailer < ActionMailer::Base

  def send_mail(user, message)
    @user = user
    @message = message

    mail to: 'glexx909@gmail.com'
    mail from: user.email
  end

end
