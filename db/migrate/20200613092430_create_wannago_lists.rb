class CreateWannagoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wannago_lists do |t|

      t.timestamps
    end
  end
end
