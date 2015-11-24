class AddGpsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gps, :string
  end
end
