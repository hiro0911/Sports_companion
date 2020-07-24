class HomesController < ApplicationController
  def top
    # ログイン時、ユーザーのメッセージルームがない場合は作成
    if user_signed_in? && Room.find_by(user_id: current_user.id).blank?
      Room.create(user_id: current_user.id)
    end
  end

  def about
  end
end
