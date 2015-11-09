require 'test_helper'

class PostsControllerTest < ActionController::TestCase
 	def setup
    @post = posts(:middle_post)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post :create, micropost: { content: "Lorem ipsum" }
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to root_url
  end
end
