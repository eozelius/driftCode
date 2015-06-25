class Post < ActiveRecord::Base
	validates :title, :presence => true, :length => { minimum: 4, maximum: 40 }
	validates :body, :presence => true 
end
