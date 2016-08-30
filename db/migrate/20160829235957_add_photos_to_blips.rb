class AddPhotosToBlips < ActiveRecord::Migration
  def change
    add_column :blips, :photos, :json
  end
end
