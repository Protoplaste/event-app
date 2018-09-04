class CreateUserEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_events do |t|
      t.integer :user_location_id
      t.integer :event_id
      t.boolean :favorite
      t.boolean :ignored
      t.timestamps
    end
  end
end
