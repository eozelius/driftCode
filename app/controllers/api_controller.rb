class ApiController < ApplicationController
	def get_way_pts
		ethan = User.find(1)
		routes = ethan.post.routes
		wp = []

		# return all waypoints belonging to the map.  this might not work, since I have change my idea of post/route/blips/waypoints so manyy times.
		render json: ethan.post.blips.to_a


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
	end

	def	get_routes
		ethan  = User.find(1)
		routes = ethan.post.routes

		render json: routes.to_a
	end
end