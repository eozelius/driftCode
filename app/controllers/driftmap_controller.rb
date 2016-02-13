include ApplicationHelper

class DriftmapController < ApplicationController
	before_action :driftmap_correct_user
	before_action :logged_in_user
	before_action :has_map, only: :new

	def new
		@user = current_user
		@driftmap = Map.new
	end

=begin
	{
		"form"=>"{
			\"user_id\":\"77\",
			\"map_title\":\"asdafasdff\",
			\"map_description\":\"asdfa\",

			\"driftmapjson=>{
				\"initZoom\":14
		
				\"initPt\":{
					\"lat\":6.245,
					\"lng\":-75.592
				},
			},
		}", 
		"controller"=>"driftmap", 
		"action"=>"create", 
		"user_id"=>"77"
	}
=end


	def create
		form = JSON.parse(params[:form])
		driftmap = Map.create(title:   form["map_title"], 
										 			body:    form["map_description"],
													user_id: form["user_id"],
										 			map: 		 form["driftmapjson"] )
		if driftmap.valid?
			current_user.map = driftmap
			flash[:success]  = "driftMap successfully created"

			respond_to do |format|
			  format.json do
			    render json: {
			      status: 'success',
			      redirct_url: user_path(current_user)
			    }.to_json
			  end
			end
		else
			flash.now[:danger] = "Whoops, something went wrong, please try again"
			respond_to do |format|
			  format.json do
			    render json: {
			      status: 'fail',
			      errors: driftmap.errors.full_messages.to_json
			    }.to_json
			  end
			end
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
