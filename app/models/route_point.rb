class RoutePoint < ActiveRecord::Base
  belongs_to :route

  validates :x, presence: true
  validates :y, presence: true
  validates :order, presence: true
  validates :route_id, presence: true
end
