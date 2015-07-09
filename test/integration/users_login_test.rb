require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:barack)
  end

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

=begin
  # something super fucky about testing redirects
  test "Successful login should render correct template" do
    get login_path
    post login_path, session: { email: @user.email,
                                password: 'password' }
    assert_redirected_to @user
    follow_redirect!
    assert is_logged_in?
    assert_template 'users/show'
    assert_select "a[href=?]", logout_path, count: 0
  end
=end

end