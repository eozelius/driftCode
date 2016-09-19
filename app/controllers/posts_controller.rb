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
			create_routes if params[:route].present?
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

		create_routes if params[:route].present?
		create_blip if params[:blip].present?

		if @post.update_attributes(post_params)
			flash[:success] = "driftmap successfully updated"
			redirect_to @user
		else
			flash[:danger] = "whoops! Something went wrong, please try again"
			render 'edit'
		end
	end

	def update_route
		# todo implement strong params and identity checking

		route = Route.find(params[:id])

		route.update_attributes(
			title: params[:title],
			description: params[:body]
		)

		if route.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
			title:   route.reload.title
		}
	end

	def update_blip
		blip = Blip.find(params[:id])

		blip.update_attributes(
			title: params[:title],
			body: params[:body]
		)

		if blip.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
			title:   blip.reload.title
		}
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
				if blip[1]["route"].present?
					@route = @post.routes.last
					@blip = @route.blips.new(
						title: blip[1]["title"],
						body:  blip[1]["body"],
						x: 		 blip[1]["x"],
						y: 		 blip[1]["y"],
						post_id: @post.id

						#post_id: blip[1]["order"]
						#order: blip[1]
					)
				else
					@blip = @post.blips.build(
						title: blip[1]["title"],
						body:  blip[1]["body"],
						x: 		 blip[1]["x"],
						y: 		 blip[1]["y"]
					)
				end

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

		def create_routes
			params[:route].each do |route|
				@route = @post.routes.build( title: route[1]["title"], description: route[1]["description"]	)
				@post.save

				create_route_points if params[:route]["0"]["routePoint"].present?

				if @route.save
					flash[:success] = "route created successfully"
				else
					flash[:danger]  = "Whoops something went wrong creating this route, please try again"
				end
			end
		end

		def create_route_points
			params[:route]["0"]["routePoint"].each do |point|
				@rp = @route.route_points.build(
					x: point[1]["x"],
					y: point[1]["y"],
					order: point[1]["order"]
				)
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
