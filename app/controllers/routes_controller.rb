class RoutesController < ApplicationController
	before_action :logged_in_user

	def new
		@user = current_user
		@route = @user.post.routes.new
	end

	def create
		@user = current_user
		@post = current_user.post
		@route = Route.new(route_params)
		@route.post_id = @post.id

		if @route.save
			# user choose to create a new blip
			if params[:new_blip].present?
 				date = Date.new(params[:blip_date].slice(0, 4).to_i, 
												params[:blip_date].slice(4, 2).to_i, 
												params[:blip_date].slice(6, 2).to_i);

				@blip = Blip.new(
					title: params[:blip_title],
					body:  params[:blip_description],
					x: 		 params[:blip_x],
					y:  	 params[:blip_y],
					date:  date
				)
				@blip.post_id = @post.id
				@blip.route_id = @route.id

				if params[:photo].present?
					params[:photo].each do |image|
						@blip.blip_images.build(image: image[1])
					end
				end
				@blip.save
			else
				flash[:danger] = 'whoops, you have to create a new blip, or use an existing one'
				render 'new'
			end

			flash[:success] = 'journey created successfully'
			redirect_to current_user
		else
			render 'new'
		end
	end

	def edit
		@user = current_user
		@post = current_user.post
		@route = Route.find(params[:id])
		@blips = @route.blips
	end

	def update
		@route = Route.find(params[:id])
		@user  = current_user
		@post  = @user.post

		if @route.update_attributes(route_params)
			# user choose to create a new blip
			if params[:new_blip].present?
				date = Date.new(params[:blip_date].slice(0, 4).to_i, 
												params[:blip_date].slice(4, 2).to_i, 
												params[:blip_date].slice(6, 2).to_i);

				@blip = Blip.new(
					title: params[:blip_title],
					body:  params[:blip_description],
					x: 		 params[:blip_x],
					y:  	 params[:blip_y],
					date:  date
				)
				@blip.post_id = @post.id
				@blip.route_id = @route.id

				# Any Photos to new blip?
				if params[:photo].present?
					params[:photo].each do |image|
						@blip.blip_images.build(image: image[1])
					end
				end
				@blip.save
			end

			flash[:success] = 'Journey Updated'
			redirect_to current_user
		else
			render 'edit'
		end
	end

	def show
		@user = current_user
		@route = Route.find(params[:id])
		@post = current_user.post
		@blips = @route.blips
	end

	def destroy
		route = Route.find(params[:id])
		route.destroy

		redirect_to current_user
	end

	private
		def route_params
			params.require(:route).permit(:title, :description, :coverphoto)
		end
end