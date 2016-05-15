require 'test_helper'

class PostsControllerTest < ActionController::TestCase
 	def setup
    @user = users(:irene)
    @post = posts(:irenes_post)
    @post.user_id = @user.id
  end

  test "new_post_path should respond correctly" do
    #get :new
    #assert_response :success
  end

  test "Valid Post should be created" do
    log_in_as(@user)

    assert_difference 'Post.count', 1 do
      post :create, post: {
        title: @post.title,
        body:  @post.body,
        user_id: @post.user_id,
        init_x: @post.init_x,
        init_y: @post.init_y,
        init_zoom: @post.init_zoom
      }
    end
  end

  test "invalid Post should not be created" do
    log_in_as(@user)

    get :new

    assert_no_difference 'Post.count' do
      p = post :create, post: {
        title: '',
        body:  @post.body,
        user_id: @post.user_id,
        init_x: @post.init_x,
        init_y: @post.init_y,
        init_zoom: @post.init_zoom
      }
    end
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