class SessionsController < ApplicationController
  def new
  end

  def create
  	# user = { User id: 1, name: "ethan", email: "ethan@gmail.com", created_at: "2015-06-28 02:27:27", updated_at: "2015-06-28 02:27:27", password_digest: "$2a$10$6QutvtRcsfR3hITaeGZskeHI5vaUYbQzE.2hJSnjhSS..."
  	user = User.find_by( email: params[:session][:email].downcase )
		if user && user.authenticate( params[:session][:password] )
			log_in user
			redirect_to user
		else
			flash.now[:danger] = "invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
  end
end
