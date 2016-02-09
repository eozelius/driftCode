class PostsController < ApplicationController
	before_action :logged_in_user,	only: [:create,  :update, :destroy]
	before_action :correct_user, 		only: [:destroy, :update]

	# ror_tut version
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post created successfully"
			redirect_to current_user
		else
			flash[:danger] = "Post not created, please try again"
			redirect_to current_user
		end
	end

	def update
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
		if @post.update(post_params)
			flash[:success] = "blib successfully updated"
			redirect_to @user
		else
			flash[:danger] = "whoops! Something went wrong, please try again"
			redirect_to @user
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
			params.require(:post).permit(:title, :body, :picture)
		end

		def correct_user
			return true if current_user.admin?

			@post = current_user.posts.find_by(id: params[:id])
			if @post.nil?
				flash.now[:danger] = "you do not have permission do that.  wwjd?"
				redirect_to root_url				
			end
		end
end
