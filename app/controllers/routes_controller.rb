class RoutesController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user

	def destroy
		route = Route.find(params[:id])
		route.destroy

		redirect_to current_user
	end

	private
		# Confirms the correct user.
		def correct_user
		  user = User.find(params[:id])

		  if current_user?(user) || current_user.admin?
		    return true
		  else
		    flash[:danger] = "You do not have permission to do that. wwjd?"
		    redirect_to(root_path)
		  end
		end
end