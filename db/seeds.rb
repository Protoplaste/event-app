# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Pulling all event categories and storing it in db to reduce the number of eventbrite requests
unless EventCategory.all.any?
  Eventbrite::Category.all.categories.each do |category|
    EventCategory.create(name: category.name, id: category.id.to_i)
  end
end

#adding example users with example locations, locations will pull events from eventbrite on save
unless User.all.any?
  u1 = User.create(email: 'example1@example.com', password: 'secret')
  u1.user_locations.new(address: 'New York', max_distance: 1).save
  u2 = User.create(email: 'example2@example.com', password: 'secret')
  u2.user_locations.new(address: 'New York', max_distance: 10).save
  u2.user_locations.new(address: 'Sidney', max_distance: 10).save
  
  u3 = User.create(email: 'example3@example.com', password: 'secret')
end
