class RenameRoutes < ActiveRecord::Migration
  def change
  	rename_table :routes, :journeys
  end
end
