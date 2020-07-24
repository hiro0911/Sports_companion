class RoomsController < ApplicationController
  def show
    @messages = Message.where(room_id: current_user.id).order(created_at: :desc)
  end
end
