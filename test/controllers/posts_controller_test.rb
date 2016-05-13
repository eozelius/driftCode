require 'test_helper'

class PostsControllerTest < ActionController::TestCase
 	def setup
    @user = users(:irene)
    @post = posts(:irenes_post)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post :create, post: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong post" do
    # log in as barack and try to delete Irene's shit
    @barack = users(:barack)
    log_in_as(@barack)

    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to root_url
  end
end