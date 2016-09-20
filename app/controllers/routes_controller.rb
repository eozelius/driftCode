class RoutesController < ApplicationController
	before_action :logged_in_user

	def create
		post = current_user.post
		
		route = post.routes.new(
			title: params[:title],
			description: params[:description]
		)

		if route.save && post.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
			title:   route.reload.title,
			id: 		 route.id
		}
	end

	def update

	end

	def destroy
		route = Route.find(params[:id])
		route.destroy

		redirect_to root_path
	end
end