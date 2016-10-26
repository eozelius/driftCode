class WelcomeController < ApplicationController
	def index
	  	@user = User.all
	  	@blips = Blip.all.order('random()')
	end
end