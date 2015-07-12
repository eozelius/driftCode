class PostsController < ApplicationController
	before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, ]

	def index
		# TODO there might be a more efficient way to do this....
		@posts = Post.all.order('created_at DESC')
		@top_post = Post.last
		@posts = @posts.offset(1)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end

		# Returns true is current_user is an admin
		def admin_user
			if !current_user
				redirect_to(root_url)
				return false
			elsif current_user.admin == true
				return true
			end
		end
end
