class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.integer :init_x
      t.integer :init_y
      t.integer :init_zoom
      
      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
  end
end