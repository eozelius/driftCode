ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  # returns true is a test user is logged in
  def is_logged_in?
  	if session[:user_id].nil?
  		return false
  	else 
  		return true
  	end
  		
  end
end
