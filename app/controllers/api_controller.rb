class ApiController < ApplicationController
	def get_way_pts
		# return all waypoints belonging to the map.  this might not work, since I have change my idea of post/route/blips/waypoints so manyy times.
		blips = User.find(1).post.blips
		wp = []

		# room for improvment - I have to create a new object, since simply rendering User.find(1).post.blips will not render blip_images since that is one heirarchy down.
		blips.each do |my_blip|
			wp.push({ id: 	  	my_blip.id,
								title:  	my_blip.title,
								body:   	my_blip.body,
								x: 		  	my_blip.x,
								y: 		  	my_blip.y,
								date: 		{ year: my_blip.date.year, month: my_blip.date.month, day: my_blip.date.day },
								images: 	my_blip.blip_images,
								post_id:	my_blip.post_id,
								route_id: my_blip.route_id })			
		end

		render json: wp
	end

	def	get_routes
		routes 	 = User.find(1).post.routes
		response = {}

		routes.each do |route|
			my_route_wps = {}
			route.blips.each do |blip|
				wp_images = []
				blip.blip_images.each do |image|
					wp_images.push(image)
				end					

				my_route_wps[blip.id] = { 
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
				}

				response[route.id] = { 
					route: route, 
					waypoints: my_route_wps 
				}
			end
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