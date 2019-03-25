class Event < ApplicationRecord
  belongs_to :event_category, foreign_key: 'category_id'
  has_many :user_events
  has_many :user_locations, through: :user_events
  has_many :users, through: :user_locations

  validates :eventbrite_id, uniqueness: true
end
