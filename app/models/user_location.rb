class UserLocation < ApplicationRecord
  belongs_to :user
  has_many :user_events
  has_many :events, through: :user_events

  validates :address, presence: true
  validates :max_distance, presence: true

  after_save find_events

  def find_events
    
  end
end
