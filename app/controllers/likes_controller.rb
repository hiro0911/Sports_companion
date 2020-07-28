class LikesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @like = Like.create(comment_id: params[:comment_id], user_id: current_user.id)
    # 非同期通信の為リダイレクトなし
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @like = Like.find_by(comment_id: params[:comment_id], user_id: current_user.id)
    @like.destroy
    # 非同期通信の為リダイレクトなし		
  end
end
