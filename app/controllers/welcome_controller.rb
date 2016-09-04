class WelcomeController < ApplicationController
	def index
  	u = User.find_by(email: 'e.ozelius@gmail.com')
  	@post = u.post
	end
end