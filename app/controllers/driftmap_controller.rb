include ApplicationHelper

class DriftmapController < ApplicationController
	before_action :driftmap_correct_user
	before_action :logged_in_user

	def new
		@user = current_user
		@driftmap = Map.new
	end

	def create
		user = current_user
		redirect_to user




	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def post_params
			params.require(:driftmap).permmit(:title, :body, :driftmapjson)
		end

		def driftmap_correct_user
			return false if current_user.nil?
			return true if current_user.admin?

			user = User.find(params[:user_id])
			if user && user == current_user
				return true
			else
				redirect_to root_url
				flash.now[:danger] = "you do not have permission do that.  wwjd?"
			end
		end
end
