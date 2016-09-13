class Route < ActiveRecord::Base
  belongs_to :post
  has_many :route_points, dependent: :destroy

  validates :description, presence: true
end
