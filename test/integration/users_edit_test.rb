require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	

	def setup
		@user = users(:barack)
	end  

	test "unsuccessful edit" do
		log_in_as(@user)
		get edit_user_path(@user)
		patch user_path(@user), user: { name: "",
																		email: 'bs_ fail-mail@aol,com',
																		password: '',
																		password_confirmation: '' }
		assert_not flash.empty?
	end

	test "successful edit" do
		log_in_as(@user)		
		get edit_user_path(@user)
		name = 'Barack Hussein Obama'
		email = 'xx_zombie_slayeur_xx@aol.com'

		patch user_path(@user), user: { name: name,
																		email: email,
																		password: '',
																		password_confirmation: '' }
		@user.reload
		# assert_equal email, @user.email
		# assert_equal name, @user.name
	end
end