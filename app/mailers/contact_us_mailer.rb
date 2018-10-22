class ContactUsMailer < ActionMailer::Base
  default to: -> {'glexx909@gmail.com'}

  def send_mail(user, message)
    @user = user
    @message = message

    mail from: %{ "TestGuru" }
  end

end
