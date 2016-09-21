class RoutePointsController < ApplicationController
	before_action :logged_in_user

	def create
		route = Route.find(params[:id])

		route_point = route.route_points.new(
			x: params[:x],
			y: params[:y],
			order: params[:order]
		)

		if route_point.save && route.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message
		}
	end

	def update

	end

	def destroy
		
	end
end