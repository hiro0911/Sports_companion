class TeamsController < ApplicationController
	def index
		@sport = Sport.find(params[:sport_id])
		@teams = Team.where(sport_id: @sport.id)
		@prefecture = Prefecture.find(params[:prefecture_id])
	end
	def new
		@team = Team.new
	end
	def create
		@team = Team.new(team_params)
		@team.save!
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
