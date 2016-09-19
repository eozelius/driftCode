class RoutesController < ApplicationController
	before_action :logged_in_user

	def destroy
		route = Route.find(params[:id])
		route.destroy

		redirect_to root_path
	end
end