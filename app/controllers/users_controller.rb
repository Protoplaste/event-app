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
    @locations = current_user.user_locations.includes(:events)
  end

  private

  def user_params
    user_params ||= params.require(:user).permit(:email, :password)
  end
end
