class TeamMembersController < ApplicationController

	def new
		@team = Team.find(params[:team_id])
	end

	def create
		@team_member = TeamMember.new
		@team_member.team_id = params[:team_id]
		@team_member.user_id = current_user.id
		if @team_member.save
			redirect_to team_team_members_thanks_path(@team_member.team)
		else
			redirect_to team_path(@team_member.team)
		end
	end

	def thanks
		@team = Team.find(params[:team_id])
	end
end
