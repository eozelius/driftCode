class WelcomeController < ApplicationController
	def index
	  	@ethan = User.find(1)
	  	@journeys = @ethan.post.journeys
	end
end