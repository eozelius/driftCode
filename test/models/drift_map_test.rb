require 'test_helper'

class DriftMapTest < ActiveSupport::TestCase
	def setup
		@user = users(:barack)
	end
	
	test "blank user_id, title, and body will not be valid" do 
		assert @user.valid?

		invalid_map_1 = DriftMap.create(title: '', body: 'valid body', user_id: 77)
		assert_not invalid_map_1.valid?
		
		invalid_map_2 = DriftMap.create(title: 'valid title', body: '', user_id: 77)
		assert_not invalid_map_2.valid?

		invalid_map_3 = DriftMap.create(title: 'valid title', body: '')
		assert_not invalid_map_3.valid?

		valid_driftmap = @user.drift_maps.create(title: 'test map', body: 'test body')
		assert valid_driftmap.valid?
	end




  # test "the truth" do
  #   assert true
  # end
end
