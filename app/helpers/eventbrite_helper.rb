module EventbriteHelper
  def self.search_eventbrite(address, distance)
    Eventbrite::Event.search({'location.address': address, 'location.within': (distance.to_s + 'km')}, Rails.application.secrets['eventbrite_access_token'])
  end
end