class BlipsController < ApplicationController
	before_action :logged_in_user

	def new
		@blip = Blip.new
	end

	def create
		@blip = Blip.new(blip_params)

		if @blip.save
			flash[:success] = "blip created"
			redirect_to current_user
		end



=begin
		
		@post  = Post.find(params[:post_id])
		
		if params[:route] == 'false'
			@blip = Blip.new(
				title: 		params[:title],
				body:  		params[:description],
				x: 		 		params[:x],
				y: 		 		params[:y],
				post_id: 	@post.id,
				route_id: nil
			)
		else
			@route = @post.routes.last	
			@blip = Blip.new(
				title: 		params[:title],
				body:  		params[:description],
				x: 		 		params[:x],
				y: 		 		params[:y],
				post_id: 	@post.id,
				route_id: @route.id
			)
		end


		if @blip.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
			title:   @blip.reload.title
		}
=end
	end

	def edit
		@blip = Blip.find(params[:id])
	end

	def update
		blip = Blip.find(params[:id])

		

=begin
		blip.update_attributes(
			title: params[:title],
			body: params[:body]
		)

		if blip.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
			title:   blip.reload.title
		}
=end
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