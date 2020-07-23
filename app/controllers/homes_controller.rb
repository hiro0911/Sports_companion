class HomesController < ApplicationController
  def top
  	if user_signed_in? && Room.find_by(user_id: current_user.id).blank?
     Room.create(user_id: current_user.id)
    end
  	@rooms = Room.all
  end

  def about
  end
end
