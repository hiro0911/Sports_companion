class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.where(user_id: current_user.id)
    @event = Event.new
  end


  def show
  end

  def edit
  end


  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save!
    redirect_to user_events_path(@event.user_id)

  end


  def update
    @event.update!(event_params)
    redirect_to user_event_path(user_id: @event.user_id)

  end
  def destroy
    @event.destroy
    redirect_to user_events_path(@event.user_id)
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :start_date, :end_date, :team_comment_room_id)
  end

end
