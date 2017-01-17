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
								date: 		my_blip.date,
								images: 	my_blip.blip_images,
								post_id:	my_blip.post_id,
								route_id: my_blip.route_id })			
		end

		render json: wp
	end

	def	get_routes
		ethan  = User.find(1)
		routes = ethan.post.routes

		render json: routes.to_a
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