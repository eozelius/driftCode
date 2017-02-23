class JourneysController < ApplicationController
	before_action :logged_in_user

	def new
		@user = current_user
		@journey = @user.driftmap.journeys.new
	end

	def create
		@user = current_user
		@driftmap = @user.driftmap
		@journey = Journey.new(journey_params)
		@journey.driftmap_id = @driftmap.id

		if @journey.save
			flash[:success] = 'journey created successfully, now create the first waypoint'
			redirect_to controller: 'waypoints', action: 'new', journey_id: @journey.id, first_wp: true
		else
			flash[:danger] = 'whoops, something went wrong, please try again'
			render 'new'
		end
	end

	def edit
		@user = current_user
		@driftmap = current_user.driftmap
		@journey = Journey.find(params[:id])
		@waypoints = @journey.waypoints
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
					title: params[:waypoint_title],
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
		@user  = current_user
		@post  = @user.post
		@route = Route.find(params[:id])
		@blips = @route.blips.order(:date)
	end

	def destroy
		route = Route.find(params[:id])
		route.destroy

		redirect_to current_user
	end

	private
		def journey_params
			params.require(:journey).permit(:title, :description, :coverphoto)
		end
end