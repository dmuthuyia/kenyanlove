class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :upvote, :downvote]
	#before_action :find_user
	#before_action :find_user, only: [:show, :upvote, :downvote]

	def index
		#@users= User.all.order("created_at DESC")
		
		@users =User.all.paginate(page: params[:page], per_page: 12).order("created_at DESC")
	end

	#def send_can_mail
	  #@parameters = User.id
	  #CanMailer.name_of_action(@parameters).deliver
	  # redirect code here
	#end

	def my_profile
		
		@random_user = User.where.not(id: @user).order("RANDOM()").first

		@random_users = User.order("RANDOM()").limit(3)
		
	end



	def show
	@user = User.find(params[:id])
	@random_user = User.where.not(id: @user).order("RANDOM()").first

	@random_users = User.order("RANDOM()").limit(3)

        #@showwh_id = @user.user_id
        #@showuserdts = User.find_for_authentication(:id => @showwh_id )
        #@showusernme = @showuserdts.name
        #@showuserpiclnk = @showuserdts.mypic.url
        #SignupMailer.user_created(@user).deliver
	end



	def upvote
		@user = User.find(params[:id])
		@user.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@user = User.find(params[:id])
		@user.downvote_by current_user
		redirect_to :back
	end

	private

	def find_user
		
		#@user= current_user
	end



end
