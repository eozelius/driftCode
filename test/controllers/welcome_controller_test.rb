require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
	test "Pages should respond & have proper title" do
		get 'index'
			assert_response :success
			assert_select "title", "home | driftingCoder"
		get 'code'
			assert_response :success
			assert_select "title", "code | driftingCoder"
		get 'photo'
			assert_response :success
			assert_select "title", "photo | driftingCoder"
	end

end