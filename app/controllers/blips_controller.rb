class BlipsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy ]

	def new
		@blip = Blip.new
	end

	def create
		@blip = Blip.new(blip_params)
		@post = current_user.post
		@blip.post_id = @post.id

		date = Date.new(params[:blip][:date].slice(0, 4).to_i,
										params[:blip][:date].slice(4, 2).to_i,
										params[:blip][:date].slice(6, 2).to_i);

		@blip.date = date

		if @blip.save
			if params[:photo].present?
				params[:photo].each do |image|
					@blip.blip_images.build(image: image[1])
				end
				@blip.save
			end
			flash[:success] = "blip created"
			redirect_to current_user
		else
			flash[:danger] = 'whoops, something went wrong'
			render 'new'
		end
	end

	def update
		@blip = Blip.find(params[:id])

		if @blip.update_attributes(blip_params)
			# update date
			date = Date.new(params[:blip][:date].slice(0, 4).to_i,
											params[:blip][:date].slice(4, 2).to_i,
											params[:blip][:date].slice(6, 2).to_i);

			@blip.date = date
			@blip.save

			if params[:photo].present?
				params[:photo].each do |image|
					@blip.blip_images.build(image: image[1])
				end
				@blip.save
			end
			flash[:success] = 'blip successfully updated'
			redirect_to current_user
		else
			flash[:danger] = 'whoops, something went wrong'
			render 'edit'
		end
	end

	def show
		@blip = Blip.find(params[:id])
		@user = User.find(Post.find(@blip.post_id).user_id);
	end

	def edit
		@blip = Blip.find(params[:id])
		@user = current_user
	end

	def destroy
		blip = Blip.find(params[:id])
		user = User.find(Post.find(blip.post_id).user_id) # wowzers

		blip.destroy
		user.reload
		flash[:success] = "Blip deleted"
		redirect_to user
	end

	private
		# todo, implement strong params
		def blip_params
			params.require(:blip).permit(:title, :body, :x, :y)
		end
end
