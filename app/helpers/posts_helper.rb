module PostsHelper
	def has_any_posts user
		user_posts = []

		if user.posts.length <= 1
			return false
		else
			user.posts.each do |post|
				# if any post attr is nil, do not return
				# Post the post only if all attr are defined except picture
				if !post.body.nil? || !post.title.nil? || !post.user_id.nil? || !post.id.nil? || !post.created_at.nil? || !post.updated_at.nil?
					user_posts.push(post)
				end
			end
		end
		return user_posts
	end

	def user_is_home user
		# byebug
		if !logged_in? || current_user.nil? || user.nil?
			return false
		elsif current_user.id == user.id
			return true
		end
	end
end
