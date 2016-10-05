class SendUsMailsController < ApplicationController
	def new
		#@send_us_mail = current_user.send_us_mails.build
		@send_us_mail = SendUsMail.new
	end

	def create
		#@send_us_mail = current_user.send_us_mails.build(send_us_mail_params)
		@send_us_mail = SendUsMail.new(send_us_mail_params)

		if @send_us_mail.save
			#redirect_to @send_us_mail


    		SendUsMailer.send_mail(@send_us_mail).deliver
			redirect_to root_path
			flash.now[:error] = nil
    		flash.now[:notice] = 'Thank you message sent'
		else
			flash.now[:error] = 'Please fill in all the necessary information'
			render 'new'
		end
	end


private


	def send_us_mail_params
		params.require(:send_us_mail).permit(:FirstName, :LastName, :phone, :email, :subject, :message, :file1)
	end

end

      