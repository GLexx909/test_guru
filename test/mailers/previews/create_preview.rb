class ContactUsMailerPreview < ActionMailer::Preview

  def send_mail
    user = User.first
    message = "Lorem ipsum"

    ContactUsMailer.send_mail(user, message)
  end

end
