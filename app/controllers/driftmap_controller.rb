class DriftmapController < ApplicationController
	def new
	end

	def create
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

end
