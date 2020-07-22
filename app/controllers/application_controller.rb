class ApplicationController < ActionController::Base
	helper_method :current_user  
	helper_method :user_is_owner

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		else
			@current_user = nil
		end
	end

	def user_is_owner
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
			return @current_user.admin
		end
	end

end