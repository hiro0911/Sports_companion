class SportsController < ApplicationController
  def index
    @sports = Sport.all
    if params[:prefecture_id]
      @prefecture = Prefecture.find(params[:prefecture_id])
    end
  end

  private

  def sport_params
    params.require(:sport).permit(:sport_genre)
  end
end
