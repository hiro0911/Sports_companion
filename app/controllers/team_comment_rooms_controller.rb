class TeamCommentRoomsController < ApplicationController
	def show
		@team_comment_room = TeamCommentRoom.find(params[:id])
		@team = Team.find_by(id: @team_comment_room.id)
		@team_comment = TeamComment.new
		@team_comments = TeamComment.where(team_comment_room_id: @team_comment_room.id).page(params[:page]).reverse_order.per(20)
	end

private
	def team_comment_room_params
	    params.require(:team_comment_room).permit(:team_id)
	end
end