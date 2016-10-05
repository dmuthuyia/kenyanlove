class ApplicationController < ActionController::Base
   #protect_from_forgery with: :exception
   protect_from_forgery with: :null_session

  #before_filter :configure_permitted_parameters, if: :devise_controller?


	#def configure_permitted_parameters
	  #devise_parameter_sanitizer.for(:sign_up) << :name
	  #devise_parameter_sanitizer.for(:account_update) << :name
	  #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :FirstName, :LastName, :UserName, :date_of_birth, :is_female, :Age, :Race, :is_kenyan, :Country, :City, :ShortBio, :LongBio, :Education, :Hobby, :Religion, :CanMove, :LookingFor, :mypic, :password, :current_password) }
      #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :FirstName, :LastName, :UserName, :date_of_birth, :is_female, :Age, :Race, :is_kenyan, :Country, :City, :ShortBio, :LongBio, :Education, :Hobby, :Religion, :CanMove, :LookingFor, :mypic, :password, :current_password) }
	#end


  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
    private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
 
end
