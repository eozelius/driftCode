class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, :presence => true, :length => { minimum: 4, maximum: 40 }
	validates :body, :presence => true 
end
