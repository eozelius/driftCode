class BlipsController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user

	def destroy
		byebug
		blip = Blip.find(params[:id])
		user = User.find(Post.find(blip.post_id).user_id)

		blip.destroy
		flash[:success] = "Blip deleted"
		redirect_to user
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