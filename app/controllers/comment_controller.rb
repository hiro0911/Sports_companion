class CommentController < ApplicationController
	def index
		@sport = Sport.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where
	end
	def create
		@comment = current_user.comments.new(comment_params)
		@comment.save
	end


private

	def comment_params
	    params.require(:comment).permit(:user_id, :room_id, :comment)
	end
end