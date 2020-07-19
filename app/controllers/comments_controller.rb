class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save!
    path = Rails.application.routes.recognize_path(request.referer)
    redirect_to path
	end


private

	def comment_params
	    params.require(:comment).permit(:user_id, 
	    																:comment_room_id, 
	    																:sentence)
	end
end
