class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      @user.send_activation_email 
      flash[:info] = "welcome to driftCode"
      log_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
    begin
      @user = User.find(params[:id])
      @post = @user.posts.build()
    rescue
      flash[:danger] = 'that user does not exist.'
      redirect_to root_url
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes( user_params )
      flash[:success] = "Save successful."
      redirect_to @user
    else
      flash.now[:danger] = "whoops! something went wrong, please try again."
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted successfully"
    redirect_to root_url
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_pic)
  	end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      if current_user?(@user) || current_user.admin?
        return true
      else 
        flash[:danger] = "You do not have permission to do that. wwjd?"
        redirect_to(root_path)
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
