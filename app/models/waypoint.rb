class Waypoint < ActiveRecord::Base
  belongs_to :journey
  has_many :waypoint_images, dependent: :destroy
  has_many :friends, dependent: :destroy

  validates :title,      presence: true, length: { minimum: 4, maximum: 120 }
  validates :journey_id, presence: true
  validates :x,          presence: true
  validates :y,          presence: true
  validates :coverphoto, presence: true

  mount_uploader :coverphoto, PictureUploader
end