class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.text :description
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
