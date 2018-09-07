namespace :daily_update do
  desc "Update"
  task eventbrite: :environment do
    puts 'begin eventbrite update'
    Event.connection
    Event.eventbrite_update
    puts 'done'
  end
end
