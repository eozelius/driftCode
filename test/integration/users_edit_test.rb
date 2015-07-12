require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	

	def setup
		@user = users(:barack)
	end  

	test "unsuccessful edit" do
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), user: { name: "",
																		email: 'bs_ fail-mail@aol,com',
																		password: '',
																		password_confirmation: '' }
		assert_not flash.empty?
		assert_template 'users/edit'
	end

	test "successful edit" do
		get edit_user_path(@user)
		name = 'Barack Hussein Obama'
		email = 'xx_zombie_slayeur_xx@aol.com'

		patch user_path(@user), user: { name: 'Barack Hussein Obama',
																		email: email,
																		password: '',
																		password_confirmation: '' }
		@user.reload
		assert_equal name, @user.name
		assert_equal email, @user.email
	end
end