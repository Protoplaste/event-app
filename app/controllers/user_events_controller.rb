class UserEventsController < ApplicationController
  load_and_authorize_resource

  def mark_favorite
    @event = UserEvent.find(params[:id].to_i)
    @event.toggle!(:favorite)
  end

  def mark_ignore
    @event = UserEvent.find(params[:id].to_i)
    @event.toggle!(:ignored)
  end
end
