include ApplicationHelper

class DriftmapController < ApplicationController
	before_action :driftmap_correct_user
	before_action :logged_in_user
	before_action :has_map, only: :new

	def new
		@user = current_user
		@driftmap = Map.new
	end

	def create
		@driftmap = Map.create(map_params)
		@driftmap.user_id = current_user.id
		if @driftmap.valid?
			current_user.map = @driftmap
			flash[:success]  = "driftMap successfully created"
			redirect_to current_user
		else
			flash[:danger] = "whoops, something went gone, please try again."
			render 'new'
		end
	end

	def edit
		@driftmap = current_user.map
	end

	def update
	end

	def destroy
	end

	private
		def map_params
			params.require(:map).permit(:title, :body, :driftmapjson)
		end

		def has_map
			unless current_user.map.nil?
				flash[:info] = "You are allowed only one driftMap"
				redirect_to current_user
			end
		end

		def driftmap_correct_user
			return false if current_user.nil?
			return true  if current_user.admin?

			user = User.find(params[:user_id])
			if user.valid? && user == current_user
				return true
			else
				flash[:danger] = "you do not have permission do that.  wwjd?"
				redirect_to root_url
			end
		end
end
