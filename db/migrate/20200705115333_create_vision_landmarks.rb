class CreateVisionLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :vision_landmarks do |t|

      t.string :name
      t.string :location
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
