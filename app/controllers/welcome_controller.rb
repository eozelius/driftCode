class WelcomeController < ApplicationController
	def index
	  	@ethan = User.find(1)
	  	#@route = @ethan.post.routes.find_by(title: '2015 - Colombia')
	  	@routes = @ethan.post.routes
	end
end