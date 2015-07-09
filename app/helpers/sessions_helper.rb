module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
		# essentially a setter for the temporery login;
	end

	# Returns the current logged-in user (if any).
	def current_user
		# returns user or nil;
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end
end