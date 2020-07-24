class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(user_id: current_user.id)
    @event = Event.new
  end

  def show
  end

  def edit
    @user = User.find(params[:user_id])
    unless @user == current_user
      redirect_to "/", notice: "権限がありません。"
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to user_events_path(@event.user_id), notice: "予定を追加しました。"
    else
      render "index"
    end
  end

  def update
    if @event.update(event_params)
      redirect_to user_event_path(user_id: @event.user_id), notice: "予定を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy
    redirect_to user_events_path(@event.user_id), notice: "予定を削除しました。"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :start_date, :end_date, :team_comment_room_id)
  end
end
