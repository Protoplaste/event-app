class AddDefaultValuesToUserEvents < ActiveRecord::Migration[5.1]
  def up
    change_column :user_events, :favorite, :boolean, default: false
    change_column :user_events, :ignored, :boolean, default: false
    UserEvent.all.each do |event|
      event.favorite = false unless event.favorite?
      event.ignored = false unless event.ignored?
      event.save
    end
  end

  def down
    change_column :user_events, :favorite, :boolean, default: nil
    change_column :user_events, :ignored, :boolean, default: nil
  end
end
