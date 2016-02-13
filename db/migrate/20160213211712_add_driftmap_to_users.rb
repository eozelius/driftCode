class AddDriftmapToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :driftmap, :string
  end
end
