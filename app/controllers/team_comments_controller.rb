class TeamCommentsController < ApplicationController
	def create
		@team_comment = TeamComment.new(team_comment_params)
		@team_comment.user_id = current_user.id
		@team_comment.save!
		redirect_to team_comment_room_path(@team_comment.team_comment_room_id)
	end


private

	def team_comment_params
	    params.require(:team_comment).permit(:user_id, 
				    															 :team_comment_room_id, 
				    															 :content)
	end
end
