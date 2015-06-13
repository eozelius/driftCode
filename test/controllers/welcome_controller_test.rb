require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
	test "home page should respond & have proper title" do
		get 'index'
		assert_response :success
		assert_select "title", "Home | myApp"
	end
end