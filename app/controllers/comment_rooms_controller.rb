class CommentRoomsController < ApplicationController
	def index
		@sport = Sport.find(params[:id])
		@comment_rooms = CommentRoom.where(sport_id: @sport.id) 
	end
	def show
		@comment_room = CommentRoom.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where(comment_room_id: @comment_room.id)
	end
	def new
		@comment_room = CommentRoom.new
		@sport = Sport.find(params[:id])
	end
	def create
		@comment_room = CommentRoom.new(comment_room_params)
		@sport = Sport.find(params[:id])
		@comment_room.sport_id = @sport.id
		@comment_room.save!
		redirect_to "/sports/comment_rooms/#{@sport.id}"
	end

private

	def comment_room_params
	    params.require(:comment_room).permit(:title, :sport_id)
	end
end