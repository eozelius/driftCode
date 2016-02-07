class DriftMap < ActiveRecord::Base
	# DB relationships
  belongs_to :user

  # attributes
  #attr :title
	#attr :body
	# attr :user_id
	#attr :map
	# attr :picture

	# validations
	validates :title, 	:presence => true, :length => { minimun: 2, maximum: 66 }
	validates :body,		:presence => true, :length => { maximum: 5000 }
	validates :user_id, :presence => true


=begin
		def picture_size
			if picture.size > 3.megabytes
				errors.add(:picture, "Photo must be less than 5MB.")
			end
		end
=end
end
