class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:password_resets][:email].downcase)
  	if @user
  		@user.create_password_reset_digest
  		@user.send_password_reset_email( @user.email )
  		message = "A password reset email has been send to "
  		message += @user.name
  		flash[:info] = message
  		redirect_to root_url
  	else
  		flash[:danger] = "Email does not exist in database."
  		render 'new'
  	end
  end

  def edit
  end
end
