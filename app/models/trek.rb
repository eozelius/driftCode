class Trek < ActiveRecord::Base
  belongs_to :waypoint

  validates :title,       presence: true, length: { minimum: 4, maximum: 120 }
  validates :description, presence: true, length: { minimum: 4, maximum: 1000 }
  #validates :coverphoto,  presence: true

  mount_uploader :coverphoto, PictureUploader
end
