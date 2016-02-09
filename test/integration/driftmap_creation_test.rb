require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

	test "Only correct user should be able to create a map" do
		# Anyone should be able to see a map
		barack = users(:barack)
		irene  = users(:irene)
		get user_path(barack)
		assert_select 'div#profile-map'

		# Not logged in, no privledges
		get new_user_driftmap_path(barack)
		assert_redirected_to login_url

		# logged in as wrong user
		log_in_as(barack)
		get new_user_driftmap_path(irene)
		assert_redirected_to login_url
	end
end