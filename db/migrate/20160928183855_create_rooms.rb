class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
