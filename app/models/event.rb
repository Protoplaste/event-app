class Event < ApplicationRecord
  has_many :user_events
  has_many :user_locations, through: :user_events
  has_many :users, through: :user_locations
end
