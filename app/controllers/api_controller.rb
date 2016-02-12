include ApiHelper

class ApiController < ApplicationController
	before_action :driftmap_correct_user

	def create_driftmap
		driftmapjson = init_driftmap(params)






		return true
	end

	private
		def driftmap_correct_user
			return false if current_user.nil?

			user = User.find(params[:user_id])
			if user == current_user || current_user.admin?
				return true
			else
				flash[:danger] = "you do not have permission do that.  wwjd?"
				redirect_to root_url
			end
		end




end

=begin
{ # params
	"user_id"=>"77", 
	"map"=>"{
		\"map_title\":\"asdfasdfasdfasdf\",
		\"map_description\":\"body adfasdfasdf\",
		\"initPt\":{
			\"lat\":5.977502019703274,
			\"lng\":-75.52716493606567},
			\"initZoom\":10
		}", 
	"controller"=>"api", 
	"action"=>"create_driftmap"
}
=end
