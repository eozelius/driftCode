require 'test_helper'

class FriendsControllerTest < ActionController::TestCase
  test "Create a new Friend" do
    get :new
    assert_response :success
  end
end