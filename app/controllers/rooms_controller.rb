class RoomsController < ApplicationController
	def index
		@rooms = Room.where(user_id: current_user.id)
	end
end
