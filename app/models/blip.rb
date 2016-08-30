class Blip < ActiveRecord::Base
  belongs_to :post

  mount_uploaders :photos, PictureUploader

  validates :title,   :presence => true, :length => { minimum: 4, maximum: 40 }
  validates :post_id, :presence => true
  validates :x,		  :presence => true
  validates :y, 	  :presence => true
end