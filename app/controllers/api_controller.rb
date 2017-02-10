class ApiController < ApplicationController
	def	routes_home
		routes 	 = User.find(1).post.routes
		response = responsify routes
		render json: response
	end

	def routes_profile_page
		user = User.find(params[:id])
		routes = user.post.routes
		response = responsify routes
		render json: response
	end

	private
		def responsify(routes)
			response = []

			routes.each do |route|
				my_route_wps = []

				route.blips.order(:date).each do |blip|
					wp_images = []
					blip.blip_images.each do |image|
						wp_images.push(image)
					end					

					my_route_wps.push({ 
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
					route: route, 
					waypoints: my_route_wps 
				})
			end

			return response
		end
end