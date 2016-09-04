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
			@post.save
			@user.save
			flash[:success] = "driftmap created successfully"

			# create Blips if user added any.
			create_blip if params[:blip].present?
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

		create_blip if params[:blip].present?

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
		def create_blip
			params[:blip].each do |blip|
				@blip = @post.blips.build(
					title: blip[1]["title"],
					body:  blip[1]["body"],
					x: 		 blip[1]["x"],
					y: 		 blip[1]["y"]
				)

				@post.save

				create_blip_images if params[:blip]["0"]["photos"].present?

				if @blip.save
					flash[:success] = "blip created successfully"
				else
					flash[:danger] = "Whoops something went wrong creating the blip, please try	again"
				end
			end
		end

		def create_blip_images
			params[:blip]["0"]["photos"].each do |photo|
				@blip_img = @blip.blip_images.build( image: photo[1] )
			end
		end

		def post_params
			params.require(:post).permit(:title, :body, :init_x, :init_y, :init_zoom)
		end

		# todo, implement strong params
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
