require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	

	def setup
		@user = users(:barack)
	end  

	test "unsuccessful edit" do
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), user: { name: 'Barack Hussein Obama',
																		email: 'Xx_zombie_slayeur_xX@aol,notcom',
																		password: 'foo',
																		password_confirmation: 'bar' }
		assert_template 'users/edit'	
	end

	test "successful edit" do
		get edit_user_path(@user)
		patch user_path(@user), user: { name: 'Barack Hussein Obama',
																		email: 'Xx_zombie_slayeur_xX@aol.com',
																		password: 'password',
																		password_confirmation: 'password' }
		assert_template 'users/show'
	end
end