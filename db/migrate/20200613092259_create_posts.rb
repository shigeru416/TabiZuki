class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :content
      t.string :place
      t.text :tips
      t.text :course
      t.integer :favorite_count
      t.timestamps
    end
  end
end
