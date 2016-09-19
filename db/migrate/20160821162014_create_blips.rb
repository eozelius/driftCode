class CreateBlips < ActiveRecord::Migration
  def change
    create_table :blips do |t|
      t.string :title
      t.text :body
      t.float :x
      t.float :y

      t.references :post, index: true, foreign_key: true
      t.references :route, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end