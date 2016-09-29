class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.integer :room_id
      t.integer :user_id
      t.date :end_date
      t.date :start_date

      t.timestamps null: false
    end
  end
end
