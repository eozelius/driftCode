class ApiController < ApplicationController
	def get_way_pts
		@ethan = User.find(1)
		@routes = @ethan.post.routes
		wp = []

		@routes.each do |route|
			route.blips.each do |way_pt|
				wp.push({	id: way_pt.id,
												title: way_pt.title,
												body:  way_pt.body,
												route_id: route.id })
			end
		end

		render json: wp
	end

	def	get_journeys



		true
	end
end