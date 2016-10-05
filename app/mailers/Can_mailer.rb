class CanMailer < ApplicationMailer

	def can_created(thisuser, current_userx)
		
		@thsusermail = thisuser.email
		@thsfirstname = thisuser.FirstName
		@thsuserid =  thisuser.id


		@myuser_id = current_userx.id
    	@myGender = current_userx.is_female
    	@myUserName = current_userx.UserName
    	@myAge = current_userx.Age
    	@myCity = current_userx.City
    	@myCountry = current_userx.Country


    	@myfirstname = current_userx.FirstName
		
		@current_usery = current_userx

    	#attachments.inline['download.png'] = File.read(@current_usery.mypic.url)
    	#data = File.read(Rails.root.join(@current_usery.mypic.url))
    	attachments.inline['download.png'] = @current_usery.mypic.url
    	#URI.join(request.url, @current_usery.mypic.url)
    	#attachments.inline['download.png'] = data
    	#mail
			#to: current_userx.email,
			mail(to: "dmuthuyia@gmail.com",
			from:"can.i@kenyanlove.com",
			subject: "#{@myUserName} sent you a Can-I"
			)
	end

end