class AddIndexToMap < ActiveRecord::Migration
  def change
  	add_index :drift_maps, [:user_id, :created_at]
  end
end
