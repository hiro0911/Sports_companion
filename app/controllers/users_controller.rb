class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@team_members = TeamMember.where(user_id: params[:id])
		@likes = Like.where(user_id: params[:id])
		@team_member = TeamMember.find_by(user_id: @user.id)
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(current_user)
		else
			render "edit"
		end
	end

	def out
  @user = current_user
  @user.destroy
  redirect_to("/")
  end

	private
	def user_params
	    params.require(:user).permit(:email,:name, :age, :sex, :introduction)
	end

end
