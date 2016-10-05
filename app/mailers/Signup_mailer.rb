class SignupMailer < ApplicationMailer
	def user_created(user)

		@userid = user.id
		@username = user.UserName
		@userfname = user.FirstName
		@userlname = user.LastName
		@userlocation = user.City

		@user = user


		mail(
			#to: user.email,
			to: "dmuthuyia@gmail.com",
			from:"app@kenyanlove.com",
			subject: "New user sign up"
			)
	end

end