class BlipsController < ApplicationController
	before_action :logged_in_user

	def destroy
		blip = Blip.find(params[:id])
		user = User.find(Post.find(blip.post_id).user_id)

		blip.destroy
		user.reload
		flash[:success] = "Blip deleted"
		redirect_to user
	end
end