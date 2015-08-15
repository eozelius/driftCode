module PostsHelper
	# Returns the current logged-in user (if any).
	def current_user
		if session[:user_id]
			# returns user or nil;
			@current_user ||= User.find_by(id: session[:user_id])
		elsif cookies.signed[:user_id]
			user = User.find_by(id: cookies.signed[:user_id])
			if user && user.authenticated?(:remember, cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end							
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	# Returns true is current_user is an admin
	def admin_user
		if !current_user
			return false
		elsif current_user.admin == true
			return true
		end
	end
end
