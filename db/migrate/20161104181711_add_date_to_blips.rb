class AddDateToBlips < ActiveRecord::Migration
  def change
  	add_column :blips, :date, :datetime
  end
end
