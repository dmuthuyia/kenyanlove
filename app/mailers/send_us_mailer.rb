class SendUsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_us_mail.send_mail.subject
  #
  def send_mail(maildetails)
 
	@FirstName = maildetails.FirstName
	@LastName = maildetails.LastName
	@phone = maildetails.phone
	@email = maildetails.email
	@subject = maildetails.subject
	@message = maildetails.message
	@file1 = maildetails.file1

    mail(to: "dmuthuyia@gmail.com",
			from:"mails@kenyanlove.com",
			subject: @subject
		)
  end
end

