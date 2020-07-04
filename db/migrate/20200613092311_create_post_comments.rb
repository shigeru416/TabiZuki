class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|

      t.string :user_id
      t.string :post_id
      t.text :comment
      t.decimal :score, precision: 5, scale: 3
      t.timestamps
    end
  end
end
