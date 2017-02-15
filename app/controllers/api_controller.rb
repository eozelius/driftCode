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

				journey.waypoints.order(:date).each do |wp|
					wp_images = []
					wp.blip_images.each do |image|
						wp_images.push(image)
					end					

					my_journey_wps.push({ 
						id: wp.id,
						title: wp.title,
						body: wp.body,
						x: wp.x,
						y: wp.y,
						journey_id: wp.journey_id,
						images: wp_images,
						post_id: journey.post_id,
						date: {
							year:  wp.date.year,
							month: wp.date.month,
							day:   wp.date.day 
						} 
					})
				end

				response.push({ 
					journey: journey, 
					waypoints: my_journey_wps 
				})
			end

			return response
		end
end