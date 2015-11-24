class Post < ActiveRecord::Base
	belongs_to 	:user

	default_scope -> { order(created_at: :desc) }

	mount_uploader :picture, PictureUploader

	validates :title, 	:presence => true, :length => { minimum: 4, maximum: 40 }
	validates :body, 		:presence => true, :length => { maximum: 5000 }
	validates :user_id, :presence => true
	validate  :picture_size

	private
		def picture_size
			if picture.size > 3.megabytes
				errors.add(:picture, "Photo must be less than 5MB.")
			end
		end
end
