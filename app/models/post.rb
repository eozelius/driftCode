class Post < ActiveRecord::Base
	belongs_to 	:user
	has_many :blips, dependent: :destroy

	validates :title, 	:presence => true, :length => { minimum: 4, maximum: 40 }
	validates :body, 		:presence => true, :length => { maximum: 5000 }
	validates :user_id, :presence => true

	# driftmap properties
	validates :init_x,		:presence => true, :length => { maximum: 99999, minimum: 0 } 
	validates :init_y,		:presence => true, :length => { maximum: 99999, minimum: 0 } 
	validates :init_zoom,	:presence => true, :length => { maximum: 99999, minimum: 0 }
end