class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save!
		redirect_to comment_room_path(@comment.comment_room_id)
	end


private

	def comment_params
	    params.require(:comment).permit(:user_id, 
	    																:comment_room_id, 
	    																:sentence)
	end
end
