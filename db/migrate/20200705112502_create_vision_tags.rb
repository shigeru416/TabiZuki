class CreateVisionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :vision_tags do |t|

      t.string :name
      t.string :vision_image_id
      t.decimal :score, precision: 5, scale: 3
      t.timestamps
    end
  end
end
