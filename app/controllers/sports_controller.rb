class SportsController < ApplicationController
  def index
    @sports = Sport.all
    if params[:prefecture_id]
      @prefecture = Prefecture.find(params[:prefecture_id])
    end
  end

  def edit
    @sport = Sport.find(params[:id])
  end
  def update
    @sport = Sport.find(params[:id])
    @sport.update(sport_params)
    redirect_to sports_path(@sport.id)
  end

  def new
    @sport = Sport.new
  end
  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to sports_path
    else
      render "new"
    end
  end

  private

  def sport_params
    params.require(:sport).permit(:sport_genre, :image)
  end
end
