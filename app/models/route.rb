class Route < ActiveRecord::Base
  belongs_to :post
  has_many :route_points, dependent: :destroy
  has_many :blips, dependent: :destroy

  mount_uploader :coverphoto, PictureUploader
end