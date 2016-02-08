class Map < ActiveRecord::Base
  belongs_to :user

  validates :title, 	:presence => true, length: { minimum: 2, maximum: 100 }
  validates :body, 		:presence => true, length: { minimum: 2, maximum: 5000 }
  validates :user_id, :presence => true
end
