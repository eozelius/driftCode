class AddCoverPhotoToRoutes < ActiveRecord::Migration
  def change
  	add_column :routes, :coverphoto, :string
  end
end
