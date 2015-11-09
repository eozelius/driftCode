class Post < ActiveRecord::Base
	belongs_to 	:user
	has_many 		:comments, dependent: :destroy

	default_scope -> { order(created_at: :desc) }

	validates :title, 	:presence => true, :length => { minimum: 4, maximum: 40 }
	validates :body, 		:presence => true, :length => { maximum: 5000 }
	validates :user_id, :presence => true
end
