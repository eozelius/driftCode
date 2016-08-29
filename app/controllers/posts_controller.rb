class PostsController < ApplicationController
	before_action :logged_in_user,	only: [:create,  :update, :destroy]
	before_action :correct_user, 		only: [:destroy, :update]

	def new
		@post = Post.new(
			title: 'my driftmap title',
			body:  'my driftmap body'
		)
	end

	def create
		@user = current_user
		@post = Post.create(post_params)
		@post.user_id = @user.id

		if @user.valid? && @post.valid?
			@user.post = @post
			flash[:success] = "driftmap created successfully"
			redirect_to @user
		else
			flash[:danger] = "Whoops something went wrong, please try again"
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)

		if params[:blip].present?
			@blip = @post.blips.create(blip_params)	
			if !blip.valid?
				flash[:danger] = "whoops! Something went wrong, please try again"
				render 'edit'
			end
		end

		if @post.update_attributes(post_params)
			flash[:success] = "driftmap successfully updated"
			redirect_to @user
		else
			flash[:danger] = "whoops! Something went wrong, please try again"
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		flash[:info] = "Post deleted"
		redirect_to current_user
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :picture, :init_x, :init_y, :init_zoom)
		end

		def blip_params
			params.require(:blip).permit(:title, :body, :x, :y)
		end

		def correct_user
			return true if current_user.admin?

			post = Post.find(params[:id])

			if post.nil? || post.user_id != current_user.id
				flash.now[:danger] = "you do not have permission do that.  wwjd?"
				redirect_to root_url				
			end
		end
end
