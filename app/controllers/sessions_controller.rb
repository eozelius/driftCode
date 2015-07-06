class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by( email: params[:session][:email].downcase )
		if user && user.authenticate( params[:session][:password] )
			#log in user and redirect to their page
			redirect_to root_path
		else
			flash.now[:danger] = "invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
  end
end
