class AddColorSchemeToDriftmaps < ActiveRecord::Migration
  def change
    add_column :driftmaps, :color_scheme, :string,  default: 'default'
  end
end
