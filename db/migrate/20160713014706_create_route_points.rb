class CreateRoutePoints < ActiveRecord::Migration
  def change
    create_table :route_points do |t|
      t.float :x
      t.float :y
      t.integer :order
      t.references :route, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
