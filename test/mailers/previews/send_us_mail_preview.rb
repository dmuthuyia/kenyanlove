# Preview all emails at http://localhost:3000/rails/mailers/send_us_mail
class SendUsMailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_us_mail/send_mail
  def send_mail
    SendUsMail.send_mail
  end

end
