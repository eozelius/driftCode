class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      @user.send_activation_email
      flash[:info] = "welcome to driftMap"
      log_in @user

      post = Post.new(
        title: 'my driftMap title',
        body:  'my driftMap description',
        init_x: 1,
        init_y: -54,
        init_zoom: 2
      )

      @user.post = post
      @user.save

      redirect_to @user 
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])

    @post = @user.post
    @post.blips.any?  ? @blips  = @post.blips.order(created_at: :desc) : @blips  = nil
    #@post.routes.any? ? @routes = @post.routes.order(created_at: :desc): @routes = nil
    #@post.routes.any? ? @routes = @post.routes.order(created_at: :desc) : @route = nil
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Save successful."
    else
      flash[:danger] = "whoops! something went wrong, please try again."
    end

    redirect_to @user
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted successfully"
    redirect_to root_url
  end

  private
  	def user_params
  		params.require(:user).permit(
        :name, 
        :email, 
        :password, 
        :password_confirmation,
        :profile_pic,
        :from, 
        :gps
      )
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
end
