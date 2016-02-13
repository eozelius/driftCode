require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@user = users(:barack)
	end

	test "Post should have valid Body and Title " do
		# empty body
		post = @user.posts.create(body: '', title: 'valid title')
		assert_not post.valid? 
		# empty title
		post = @user.posts.create(body: 'Hipsum ipsum, toss me a pbr Domino!!!', title: '')
		assert_not post.valid?
	end

	test "Post must have user_id" do
		post = @user.posts.create(body: 'valid hipster ipsum, rad flannel tex!!!', title: 'valid title & stuff')
		post.user_id = nil
		assert_not post.valid?
	end

	test "Posts should be in created_first order" do
		assert_equal posts(:first_post), Post.first
		assert_equal posts(:last_post), Post.last
	end

	test "Post should be destroyed when user who created post is destoryed" do
		@user.save
		@user.posts.create!(body: 'valid Body', title: 'valid title')
		assert_difference 'Post.count', -1 do
			@user.destroy
		end
	end
end
