class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.string :url
      t.integer :category_id
      t.timestamps
    end
  end
end
