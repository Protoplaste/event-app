class UserEvent < ApplicationRecord
  belongs_to :user_location
  has_one :user, through: :user_location
  belongs_to :event

  delegate :name, :start_date, :url, :event_category, to: :event
end
