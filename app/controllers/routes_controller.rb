class RoutesController < ApplicationController
	before_action :logged_in_user

	def new
		@user = current_user
		@route = @user.post.routes.new
	end



	def destroy
		route = Route.find(params[:id])
		route.destroy

		redirect_to current_user
	end
end