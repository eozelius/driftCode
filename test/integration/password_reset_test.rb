require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest

	def setup
		ActionMailer::Base.deliveries.clear
		@user = users(:irene)
	end

	test "password resets" do 
=begin
		get new_password_reset_path
		assert_template 'password_resets/new'

		# Invalid email
		post password_resets_path, password_resets: { email: "" }
		assert_not flash.empty?
		assert_template 'password_resets/new'

		# Valid email
		post password_resets_path, password_resets: { email: @user.email }
		assert_not_equal @user.password_reset_digest, @user.reload.password_reset_digest
		assert_equal 1, ActionMailer::Base.deliveries.size
		assert_not flash.empty?
		assert_redirected_to root_url

		# Password Reset Form
		user = assigns(:user)
		
			# Wrong email
			get edit_password_reset_path(user: user, email: "")
			assert_redirected_to root_url
		
			# Inactive User
			user.toggle!(:activated)
			get edit_password_reset_path(user.password_reset_token, email: user.email)
			assert_redirected_to root_url
			user.toggle!(:activated)

			# Right email, wrong token
			get edit_password_reset_path('wrong token', email: user.email)
			assert_redirected_to root_url

			# Right email, Right token
			get edit_password_reset_path(user.password_reset_token, email: user.email)			
			assert_template 'password_resets/edit'
			assert_select "input[name=email][type=hidden][value=?]", user.email

		# Edit Password Form
			# Invalid Password and Confirmation
			patch password_reset_path(user.password_reset_token),
				email: user.email,
				user: {	password: 							'foobar',
								password_confirmation: 	'12345'	}
			assert_not is_logged_in?
			assert_not flash.empty?

			# Blank Password & confirmation
			patch password_reset_path(user.password_reset_token),
				email: user.email,
				user: {	password: 							'',
								password_confirmation: 	''	}
			assert_not is_logged_in?
			assert_not flash.empty?
			assert_template 'password_resets/edit'

			# Finally Valid password and confirm
			patch password_reset_path(user.password_reset_token),
				email: user.email,
				user: {	password: 							'japan123',
								password_confirmation: 	'japan123' }
			assert is_logged_in?
			assert_not flash.empty?
			assert_redirected_to user
=end
	end
end