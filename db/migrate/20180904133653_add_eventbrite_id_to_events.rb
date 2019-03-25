class AddEventbriteIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :eventbrite_id, :string
  end
end
