class CreateBlipImages < ActiveRecord::Migration
  def change
    create_table :blip_images do |t|
      t.string :image
      t.references :blip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
