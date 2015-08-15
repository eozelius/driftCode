class SessionsController < ApplicationController
  def new
  end

  # creates new user and logs in.
  def create
  	# user = { User id: 1, name: "ethan", email: "ethan@gmail.com", created_at: "2015-06-28 02:27:27", updated_at: "2015-06-28 02:27:27", password_digest: "$2a$10$6QutvtRcsfR3hITaeGZskeHI5vaUYbQzE.2hJSnjhSS..."
  	user = User.find_by( email: params[:session][:email].downcase )
		if user && user.authenticate( params[:session][:password] )
			
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
		  	redirect_back_or user
		  else
        message =  "driftCode account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end

    else
      flash.now[:danger] = "Invalid email/password combination"
  		render 'new'
  	end
  end

  # logs out current user
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
