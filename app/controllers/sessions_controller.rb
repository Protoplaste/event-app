class SessionsController < ApplicationController
  def new
    redirect_to '/profile' if current_user
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)

    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to profile_path
    else
      @err = 'invalid email or password!'
      render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_params
    session_params ||= params.require(:session).permit(:email, :password)
  end
end
