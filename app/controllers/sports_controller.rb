class SportsController < ApplicationController
	def index
		@sports = Sport.all
	end


private
	def sport_params
	    params.require(:sport).permit(:sport_genre)
	end
end