class AddDriftmapjsonToMaps < ActiveRecord::Migration
  def change
  	add_column :maps, :driftmapjson, :text
  end
end
