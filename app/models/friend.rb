class Friend < ActiveRecord::Base
  # ActiveRecord
  belongs_to :waypoint

  # Attributes
  attr :first_name
  attr :last_name
  attr :photo
  attr :description
  attr :x
  attr :y
  attr :member
  attr :visible

  # Validations
  validates :first_name,  presence: true, length: { minimum: 4, maximum: 120 }
  validates :description, presence: true, length: { minimum: 4, maximum: 1000 }
  validates :x, presence: true
  validates :y, presence: true

  # Methods

end