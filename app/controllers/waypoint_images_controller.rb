class WaypointImagesController < ApplicationController
	def create
		@blip = current_user.post.blips.last

		params[:blip_image].each do |image|
			@blip_image = @blip.blip_images.build( image: image[1]["image"] )			
		end

		if @blip.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
		}
	end

	def update
		@blip = Blip.find(params[:id])

		params[:blip_image].each do |image|
			@blip_image = @blip.blip_images.build( image: image[1]["image"] )
		end

		if @blip.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
		}
	end

	def destroy

	end
end