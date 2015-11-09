class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

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
      flash[:info] = "An account activation email has been sent to your email to authenticate your account."
      redirect_to root_url

=begin TODO not sure if i want to require this authorization.
      log_in @user
      flash[:success] = "welcome to your new chill spot."
  		redirect_to @user
=end

  	else
  		render 'new'
  	end
    #debugger
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.build()
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
      flash.now[:danger] = "Whoops try again."
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
