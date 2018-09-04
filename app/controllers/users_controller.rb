class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :new
  def new
    redirect_to '/profile' if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def profile
    #fetches current users events along with those events categories and locations
    @events = current_user.events
                          .includes(:event_category, :user_locations)
                          .where('user_locations.user_id = ?', current_user.id).references(:user_locations) #only locations belonging to current user
  end

  private

  def user_params
    user_params ||= params.require(:user).permit(:email, :password)
  end
end
