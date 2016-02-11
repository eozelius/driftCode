class Map < ActiveRecord::Base
  belongs_to :user

  validates :title, 	:presence => true, length: { minimum: 2, maximum: 100 }
  validates :body, 		length: { minimum: 2, maximum: 5000 }
  validates :user_id, :presence => true, :uniqueness => true
end
=begin
class Map < ActiveRecord::Base
	# activerecord relationships
	belongs_to :user

	# properties
	attr_accessor :user_id
	attr_accessor :title
	attr_accessor :body
	attr_accessor :driftmapjson

	# validations

	driftmapjson: {
		name: 'my drift map',
		init: [40.735, -73.890],
		zoom: 18,

		markers: [
			{
				title: 'medelling colombia',
				body: 'This place is dope',
				pictures: [img1.jpg, img2.jpg],
			},
			{
				title: 'new york, new york',
				body: 'This place is home',
				pictures: [img3.jpg, img4.jpg]
			}
		],

		routes: [
			{
				title: 'New york to colombia',
				type: 'plane',
				start: [xx.xx, xx.xx],
				finish: [xx.xx, xx.xx]
			},
			{
				title: 'Colombia to london',
				type: 'boat',
				start: [xx.xx, xx.xx],
				finish: [xx.xx, xx.xx]
			}
		]
	}



=> ["id", "title", "body", "driftmapjson", "user_id", "created_at", "updated_at"] 

=end

