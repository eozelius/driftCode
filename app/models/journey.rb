class Journey < ActiveRecord::Base
  belongs_to :driftmap
  has_many :waypoints, dependent: :destroy

  mount_uploader :coverphoto, PictureUploader
end