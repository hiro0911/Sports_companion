class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@team_members = TeamMember.where(user_id: params[:id])
		@likes = Like.where(user_id: params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(current_user)
	end
	private
	def user_params
	    params.require(:user).permit(:email,:name, :age, :sex, :introduction)
	end

end
