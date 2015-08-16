class PasswordResetsController < ApplicationController
  before_action :get_user,          only: [:edit, :update]
  before_action	:valid_user,        only: [:edit, :update]
  before_action :check_expiration,  only: [:edit, :update]
  
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
    if params[:user][:password].empty?
      flash.now[:danger] = "Password can not be empty"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password reset successfully"
      redirect_to @user
    else
      render 'edit'
    end        
  end

  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

  	def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      # if any of these fail, goto root
      if !@user || !@user.activated? || !@user.authenticated?(:password_reset, params[:id])
        redirect_to root_url
        flash[:danger] = "Whoops something went wrong, please try again."
      end
    end 

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired"
        redirect_to new_password_reset_path
      end
    end       
end

