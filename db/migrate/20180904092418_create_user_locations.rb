class CreateUserLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_locations do |t|
      t.integer :user_id
      t.string :address
      t.integer :max_distance
      t.timestamps
    end
  end
end
