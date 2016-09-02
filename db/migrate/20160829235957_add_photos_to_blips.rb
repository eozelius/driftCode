class AddPhotosToBlips < ActiveRecord::Migration
  def change
    add_column :blips, :photos, :string, array: true, default: []
  end
end
