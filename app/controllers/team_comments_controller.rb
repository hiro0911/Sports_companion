class TeamCommentsController < ApplicationController
  def create
    @team_comment_room = TeamCommentRoom.find(params[:team_comment_room_id])
    @team = @team_comment_room.team
    @team_comments = TeamComment.where(team_comment_room_id: @team_comment_room.id).page(params[:page]).reverse_order.per(20)
    @team_comment = TeamComment.new(team_comment_params)
    @team_comment.user_id = current_user.id
    @team_comment.save
  end

  def destroy
    @team_comment_room = TeamCommentRoom.find(params[:team_comment_room_id])
    @team = @team_comment_room.team
    @team_comments = TeamComment.where(team_comment_room_id: @team_comment_room.id).page(params[:page]).reverse_order.per(20)
    @team_comment = TeamComment.find(params[:id])
    @team_comment.destroy
  end

  private

  def team_comment_params
    params.require(:team_comment).permit(:user_id,
                                         :team_comment_room_id,
                                         :content)
  end
end
