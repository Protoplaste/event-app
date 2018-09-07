class User < ApplicationRecord
  has_many :user_locations, dependent: :destroy
  has_many :user_events, through: :user_locations
  has_many :events, through: :user_locations

  before_save {self.email = email.downcase}

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, message: 'This email adress is already taken' }
  validates :password, presence: true, length: { minimum: 6, message: 'Password needs to be minimum 6 characters long' }

  has_secure_password

  def fetch_events(archive: false)
    #fetches current users unignored events along with event categories and locations

    user_events.where(ignored: false)
               .eager_load(:user_location, event: :event_category)
               .where("start_date #{archive ? '<=' : '>='} ?", Date.today) #only fetches upcoming or archived events
               .sort_by {|e| e.user_location.address} #sort by location name
  end

  def search(params)
    #fetches current users unignored events along with event categories and locations
    events = user_events.where(ignored: false)
                        .eager_load(:user_location, event: :event_category)

    #filters events by date range if date range was provided
    if params[:start_date].present? && params[:end_date].present?

      events = events.where(events: { start_date: params[:start_date].to_date..params[:end_date].to_date })
    end
    #filters events by category if category was provided
    if params[:category].present?

      events = events.where(events: { event_categories: { name: params[:category]} })
    end
    events
  end
end
