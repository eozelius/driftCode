require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
	test "Pages should respond & have proper title" do
		get 'index'
			assert_response :success
			assert_select "title", "home | driftCode"
		get 'code'
			assert_response :success
			assert_select "title", "code | driftCode"
		get 'photo'
			assert_response :success
			assert_select "title", "photo | driftCode"
	end

end