class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @team_members = TeamMember.where(user_id: params[:id])
    @likes = Like.where(user_id: params[:id])
    @applicants = Applicant.where(user_id: current_user.id)
    @room = Room.find_by(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to "/", notice: "権限がありません。"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "ユーザー情報を更新しました。"
    else
      render "edit"
    end
  end

  def out
    @user = current_user
    @user.destroy
    redirect_to "/", nocite: "ユーザー情報を削除しました。"
  end

  def google
    @user = User.find_for_google(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
      session[:user_id] = @user.id #add
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :age, :sex, :introduction)
  end
end
