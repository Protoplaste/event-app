class Ability
  include CanCan::Ability

  def initialize(current_user)
    #actions allowed by all users
    can :create, User
    #actions allowed only by logged in users
    if current_user.present?
      can :manage, User, id: current_user.id
      can :manage, UserLocation, user_id: current_user.id
      can :manage, UserEvent do |user_event|
        user_event.user_location.user_id == current_user.id
      end
    end
  end
end
