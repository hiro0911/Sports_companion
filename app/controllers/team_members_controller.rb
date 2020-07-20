class TeamMembersController < ApplicationController

	def new
		@team = Team.find(params[:team_id])
		@team_member = TeamMember.new
	end

	def create
		@team_member = TeamMember.new
		@team = Team.find(params[:team_id])
		@team_member.team_id = params[:team_id]
		@team_member.user_id = current_user.id
		if @team_member.save
			redirect_to team_team_members_thanks_path(@team_member.team)
		else
			render "new"
		end
	end

	def thanks
		@team = Team.find(params[:team_id])
	end

	def index
		@team = Team.find(params[:id])
		@team_members = TeamMember.where(team_id: @team.id).page(params[:page]).reverse_order.per(15)
	end

	def destroy
		@team_member = TeamMember.find(params[:id])
		@team_member.destroy!
		redirect_to user_path(current_user)
	end
	def team_member_params
	    params.require(:team_member).permit(:user_id,:team_id)
	end
end
