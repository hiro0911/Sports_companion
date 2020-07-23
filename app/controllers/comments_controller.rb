class CommentsController < ApplicationController
  def create
    @comment_room = CommentRoom.find(params[:comment_room_id])
    @comments = Comment.where(comment_room_id: @comment_room.id).page(params[:page]).reverse_order.per(20)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    @comment_room = CommentRoom.find(params[:comment_room_id])
    @comments = Comment.where(comment_room_id: @comment_room.id).page(params[:page]).reverse_order.per(20)
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id,
                                    :comment_room_id,
                                    :sentence)
  end
end
