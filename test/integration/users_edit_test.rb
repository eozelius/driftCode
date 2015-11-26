require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = users(:barack)
		@admin = users(:ethan)
	end  

	test "unsuccessful edit" do
		old_name = @user.name
		old_email = @user.email

		log_in_as(@user)
		patch user_path(@user), user: { name: "",
																		email: 'bs_ fail-mail@aol,com',
																		password: '',
																		password_confirmation: '' }
		assert_not flash.empty?
		@user.reload
		assert_equal old_name,  @user.name
		assert_equal old_email, @user.email
	end

	test "admins should be able to edit own info and user's info" do
		get user_path(@admin)
		assert_template 'users/show'
		new_name   = 'new_ethan'
		new_email = 'newe.ozelius@gmail.com'

		patch user_path(@admin), user: {
			name: new_name,
			email: new_email,
			password: '',
			password_confirmation: ''
		}

		@admin.reload
		assert_equal new_name, 	@admin.name
		assert_equal new_email, @admin.email
	end
end