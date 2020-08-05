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
    if @sport.update(sport_params)
      # google_apiに画像の値を渡す
      unless @sport.image.blank?
        visions = Vision.get_image_data(@sport.image)

      # 受け取ったデータの配列を排出
        visions.each do |vision|
      # 不適切な画像である場合が高い又は非常に高い場合ブロック
          if vision.include?("VERY_LIKELY") || vision.include?("LIKELY")
            flash[:notice] = "不適切な画像の為ブロックされました。" 
            @sport.image = nil
            @sport.save
            return render "edit"
          end
        end
      end
      path = Rails.application.routes.recognize_path(request.referer)
      redirect_to path, notice: "スポーツをジャンル更新しました。"
    else
      render "edit" 
    end
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      # google_apiに画像の値を渡す
      unless @sport.image.blank?
        visions = Vision.get_image_data(@sport.image)

      # 受け取ったデータの配列を排出
        visions.each do |vision|
      # 不適切な画像である場合が高い又は非常に高い場合ブロック
          if vision.include?("VERY_LIKELY") || vision.include?("LIKELY")
            flash[:notice] = "不適切な画像の為ブロックされました。" 
            @sport.destroy
            return render "new"
          end
        end
      end
      path = Rails.application.routes.recognize_path(request.referer)
      redirect_to path, notice: "スポーツジャンルを作成しました。"
    else
      render "new" 
    end
  end

  private

  def sport_params
    params.require(:sport).permit(:sport_genre, :image)
  end
end
