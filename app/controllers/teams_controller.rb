class TeamsController < ApplicationController
	def index
		@sport = Sport.find(params[:sport_id])
		@teams = Team.where(sport_id: @sport.id)
		@prefecture = Prefecture.find(params[:prefecture_id])

		@team_comment_rooms = TeamCommentRoom.all
	end
	def new
		@team = Team.new
	end
	def show
		@team = Team.find(params[:id])
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		@team.update!(team_params)
		redirect_to team_path(@team)
	end

	def create
		@team = Team.new(team_params)
		@team.save!
		TeamCommentRoom.create(team_id: @team.id)
		redirect_to prefecture_sport_teams_path

	end

private

	def team_params
	    params.require(:team).permit(:sport_id,
	    														 :prefecture_id,
	    														 :name,
	    														 :image,
	    														 :applicant,
	    														 :area,
	    														 :team_name,
	    														 :introduction,
	    														 :stance,
	    														 :explanation)
	end
end
