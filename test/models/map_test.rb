require 'test_helper'

class MapTest < ActiveSupport::TestCase
	def setup
		@user = users(:barack)
		assert @user.valid?
	end

	test "maps must have title, body, and user_id" do
		invalid_map_1 = Map.create(title: '', body: 'body', user_id: 77)
		assert_not invalid_map_1.valid?
		invalid_map_2 = Map.create(title: 'title', body: '', user_id: 77)
		assert_not invalid_map_2.valid?
		invalid_map_3 = Map.create(title: 'title', body: 'body')
		assert_not invalid_map_3.valid?

		valid_map = Map.create(title: 'title', body: 'body', user_id: @user.id)
		assert valid_map.valid?
	end
end
