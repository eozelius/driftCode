require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup data should fail" do 
  	get signup_path
  		assert_no_difference 'User.count' do
  			post users_path, user: { name: "", 
  															 email: "invalidUser@invalid.com",
  															 password: "foo",
  															 password_confirmation: "bar"
  														 }
  		end
  	assert_template 'users/new'
  	assert_select 'div.errors'
  end

  test "signup with valid data should pass" do
  	get signup_path
  	assert_difference 'User.count', 1 do
		 	post_via_redirect users_path, user: { name: "Miagi Proper",
		 																				email: "properEmail@gmail.com",
		 																				password: "Japan123",
		 																				password_confirmation: "Japan123" }
		end
		assert_template 'users/show'
  end
end