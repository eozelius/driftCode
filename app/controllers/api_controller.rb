class ApiController < ApplicationController
	def	get_routes
		routes 	 = User.find(1).post.routes
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
					images: wp_images,
					post_id: blip.post_id,
					route_id: blip.route_id,
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

		render json: response
	end
end

=begin
	routes.each do |route|
		route.blips.each do |way_pt|
			wp.push({	id: way_pt.id,
											title: way_pt.title,
											body:  way_pt.body,
											route_id: route.id })
		end
	end
=end