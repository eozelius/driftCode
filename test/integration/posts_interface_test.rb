require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:tex)
  end

  test "post interface" do
  	log_in_as(@user)
  	# get root_url
  	# assert_select <feed element>
  	
  	# Invalid Request
  	assert_no_difference 'Post.count' do
  		post posts_path, post: { body: '', title: '' }
  	end
  	assert_redirected_to @user

  	# Valid Submission
  	assert_difference 'Post.count', 1 do
  		post posts_path, post: { body: 'to be deleted', title: 'to be deleted' }
  	end
		assert_redirected_to @user
		follow_redirect!
		assert_template 'users/show'

		# Delete a Post
		assert_difference 'Post.count', -1 do
			delete post_path(@user.posts.first)
		end  	

		# Visit a different User
		get user_path(users(:irene))
		assert_select 'a', text: 'delete', count: 0
  end
end
