class CreateVisionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :vision_tags do |t|

      t.string :name
      t.timestamps
    end
  end
end
