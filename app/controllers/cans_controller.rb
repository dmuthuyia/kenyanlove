class CansController < ApplicationController


	def sending_can

  		@user = User.find(params[:id])

  		@tsuser_id = @user.id
    	@tsGender = @user.is_female
    	@tsUserName = @user.UserName
    	@tsAge = @user.Age
    	@tsCity = @user.City
    	@tsCountry = @user.Country
    	@tsemail = @user.email

    	@all_me = current_user

        



        @can = Can.new(Can_this_id: @tsuser_id, Gender: @tsGender, UserName: @tsUserName, Age: @tsAge, City: @tsCity, Country: @tsCountry, email: @tsemail)

        @can.save
	        if @can.save
	    
	        	CanMailer.can_created(@user, @all_me).deliver
	        	redirect_to users_path

	        else
	        	redirect_to user_path(@user)
	        end
	end


end
