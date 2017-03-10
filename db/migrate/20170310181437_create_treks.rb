class CreateTreks < ActiveRecord::Migration
  def change
    create_table :treks do |t|

      t.timestamps null: false
    end
  end
end
