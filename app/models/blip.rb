class Blip < ActiveRecord::Base
  belongs_to :journey
  has_many :blip_images, dependent: :destroy

  validates :title,   :presence => true, :length => { minimum: 4, maximum: 120 }
  validates :journey_id, :presence => true
  validates :x,		  :presence => true
  validates :y, 	  :presence => true
end