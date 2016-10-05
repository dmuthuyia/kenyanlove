class RegistrationsController < Devise::RegistrationsController

  
  #def sign_up_params
    #params.require(:user).permit(:email, :FirstName, :LastName, :UserName, :date_of_birth, :is_female, :Age, :Race, :is_kenyan, :Country, :City, :ShortBio, :LongBio, :Education, :Hobby, :Religion, :CanMove, :LookingFor, :mypic)
  #end

  #def account_update_params
    #params.require(:user).permit(:email, :FirstName, :LastName, :UserName, :date_of_birth, :is_female, :Age, :Race, :is_kenyan, :Country, :City, :ShortBio, :LongBio, :Education, :Hobby, :Religion, :CanMove, :LookingFor, :mypic)
  #end

  #after_create :send_admin_mail
  #def send_admin_mail
    #UserMailer.send_new_user_message(self).deliver
    #SignupMailer.user_created(@user).deliver
  #end


  # GET /resource/sign_up


  def create
    super
    if @user.persisted?
      #SignupMailer.user_created(@user).deliver unless @user.invalid?
      SignupMailer.user_created(@user).deliver
      NewUserEmail.notify_user(@user).deliver
    end
  end



  private

  	def sign_up_params
		params.require(:user).permit(:email, :FirstName, :LastName, :UserName, :date_of_birth, :is_female, :Age, :Race, :is_kenyan, :Country, :City, :ShortBio, :LongBio, :Education, :Hobby, :Religion, :CanMove, :LookingFor, :mypic, :password, :current_password)
	end

	def account_update_params
		params.require(:user).permit(:email, :FirstName, :LastName, :UserName, :date_of_birth, :is_female, :Age, :Race, :is_kenyan, :Country, :City, :ShortBio, :LongBio, :Education, :Hobby, :Religion, :CanMove, :LookingFor, :mypic, :password, :current_password)
	end


end
