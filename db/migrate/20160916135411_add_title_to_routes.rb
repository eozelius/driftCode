class AddTitleToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :title, :string
  end
end
