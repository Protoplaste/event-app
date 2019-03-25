class UserLocation < ApplicationRecord
  include EventbriteHelper

  belongs_to :user
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  validates :address, presence: true
  validates :max_distance, presence: true

  after_save { pull_events }

  def pull_events
    #pulls events form eventbrite based on address and distance
    callback = EventbriteHelper.search_eventbrite(self.address, self.max_distance)
    #creates new events or updates old ones
    callback.events.each do |e|
      if event = Event.find_by(eventbrite_id: e.id)
        event.update(eventbrite_attributes(e))
      else
        event = Event.create(eventbrite_attributes(e))
      end
        UserEvent.find_or_create_by(user_location_id: self.id, event_id: event.id)
    end
  end

  def eventbrite_attributes(event)
    {
      eventbrite_id: event.id,
      name: event.name.text,
      start_date: event.start.utc.to_date,
      url: event.url,
      category_id: event.category_id.to_i
    }
  end
end
