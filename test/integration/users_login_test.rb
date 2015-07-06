require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "Log in with invalid information" do
	  get login_path
  	assert_template 'sessions/new'
  	post login_path, session: { email: 'invalid123@iamversmart,starbux',
  													 		password: 'invalid as texas' }
  	assert_template 'sessions/new'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?		
  end
end