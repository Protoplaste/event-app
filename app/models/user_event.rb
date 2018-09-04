class UserEvent < ApplicationRecord
  belongs_to :user_location
  belongs_to :event
end
