class ApiController < ApplicationController
	def	home
		journeys = User.find(1).post.journeys
		response = responsify journeys
		render json: response
	end

	def profile_page
		user = User.find(params[:id])
		journeys = user.post.journeys
		response = responsify journeys
		render json: response
	end

	private
		def responsify(journeys)
			response = []

			journeys.each do |journey|
				my_journey_wps = []

				journey.blips.order(:date).each do |blip|
					wp_images = []
					blip.blip_images.each do |image|
						wp_images.push(image)
					end					

					my_journey_wps.push({ 
						id: blip.id,
						title: blip.title,
						body: blip.body,
						x: blip.x,
						y: blip.y,
						route_id: blip.route_id,
						images: wp_images,
						post_id: blip.post_id,
						date: {
							year:  blip.date.year,
							month: blip.date.month,
							day:   blip.date.day 
						} 
					})
				end

				response.push({ 
					route: journey, 
					waypoints: my_journey_wps 
				})
			end

			return response
		end
end