class CommentRoomsController < ApplicationController
  def index
    @sport = Sport.find(params[:sport_id])
    @comment_rooms = CommentRoom.where(sport_id: @sport.id).page(params[:page]).reverse_order.per(15)
  end

  def show
    @comment_room = CommentRoom.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(comment_room_id: @comment_room.id).page(params[:page]).reverse_order.per(20)
    @like = Like.new
    @likes = Like.all
  end

  def new
    @comment_room = CommentRoom.new
    @sport = Sport.find(params[:sport_id])
  end

  def create
    @comment_room = CommentRoom.new(comment_room_params)
    @sport = Sport.find(params[:sport_id])
    @comment_room.sport_id = @sport.id
    if @comment_room.save
      redirect_to "/sports/#{@sport.id}/comment_rooms"
    else
      render "new"
    end
  end

  private

  def comment_room_params
    params.require(:comment_room).permit(:title, :sport_id)
  end
end
