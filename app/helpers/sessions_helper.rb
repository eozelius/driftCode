module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
		# essentially a setter for the temporery login;
	end

	# Remembers a user in a persistent session.
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	# Returns the current logged-in user (if any).
	def current_user
		if session[:user_id]
			# returns user or nil;
			@current_user ||= User.find_by(id: session[:user_id])
		elsif cookies.signed[:user_id]
			user = User.find_by(id: cookies.signed[:user_id])
			if user && user.authenticated?(cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end							
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end

	# logs out current user
	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	# forgets a persistant session
	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end
end