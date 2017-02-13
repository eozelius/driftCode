class Journey < ActiveRecord::Base
  belongs_to :post
  has_many :blips, dependent: :destroy

  mount_uploader :coverphoto, PictureUploader
end