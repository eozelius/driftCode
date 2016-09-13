class AddBlipsToRoutes < ActiveRecord::Migration
  def change
    add_column :blips, :route_id, :integer
  end
end
