class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.text :body
      #t.text :driftmapjson
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
