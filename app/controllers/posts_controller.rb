class PostsController < ApplicationController
	before_action :logged_in_user,	only: [:create, :destroy]
	before_action :correct_user, 		only: :destroy

	def index
		# TODO there might be a more efficient way to do this....
		@posts = Post.all
		@top_post = Post.last
		@posts = @posts.offset(1)
	end

=begin Only way to create new post is via @user's porfile page; we should improve this
	def new
		@post = Post.new
	end
=end
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


=begin Blog version
	def create
		@post = Post.new(post_params)
		
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end
=end

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

		flash[:info] = "Post deleted"
		redirect_to current_user
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :picture)
		end

		def correct_user
			@post = current_user.posts.find_by(id: params[:id])
			redirect_to root_url if @post.nil?
		end



=begin # dead code I want to keep 11/9/2015
		# Returns true is current_user is an admin
		def admin_user
			if !current_user
				redirect_to(root_url)
				return false
			elsif current_user.admin == true
				return true
			end
		end
=end
end
