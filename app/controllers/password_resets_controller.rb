class PasswordResetsController < ApplicationController
  before_action :get_user,		only: [:edit, :update]
  before_action	:valid_user,	only: [:edit, :update]
  
  def new
  end

  def create
  	@user = User.find_by(email: params[:password_resets][:email].downcase)
  	if @user
  		@user.create_password_reset_digest
  		@user.send_password_reset_email
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

  def update
  end

  private
  	def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      # if any of these fail, goto root
      if( !@user || !@user.activated? || !@user.authenticated?(:password_reset, params[:id]))
        redirect_to root_url
        flash[:danger] = "Whoops something went wrong, please try again."
      end
    end        
end

