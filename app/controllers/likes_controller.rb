class LikesController < ApplicationController
	def create
		@like = Like.create(comment_id: params[:comment_id], user_id: current_user.id)
		path = Rails.application.routes.recognize_path(request.referer)
    redirect_to path
	end

	def destroy
		@like = Like.find_by(comment_id: params[:comment_id], user_id: current_user.id)
		@like.destroy!
		path = Rails.application.routes.recognize_path(request.referer)
    redirect_to path
	end
end
