class MessagesController < ApplicationController
  def new
    @message = Message.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.room_id = @user.id
    @message.save
    redirect_to user_path(@user), notice: "メッセージを送信しました。"
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :room_id, :title, :content)
  end
end
