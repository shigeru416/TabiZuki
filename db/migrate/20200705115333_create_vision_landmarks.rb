class CreateVisionLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :vision_landmarks do |t|

      t.string :name
      t.string :location
      t.string :latitude
      t.string :longitude
      t.string :vision_image_id
      t.decimal :score, precision: 5, scale: 3
      t.timestamps
    end
  end
end
