class NewUserEmail < ApplicationMailer
	def notify_user(user)
		@user = user

		@userid = @user.id
		@username = @user.UserName
		@userfirstname = @user.FirstName

		#mail(to: @user.email, subject: "welcome" )
		#mail(to: "dmuthuyia@gmail.com", subject: "Kenyan Love welcomes you: Welcome message" )
	
		mail(to: "dmuthuyia@gmail.com",
			from:"info@kenyanlove.com",
			subject: "Kenyan Love welcomes you #{@userfirstname}"
			)

	end

end
