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
            @sport.image = nil
            @sport.save
            return redirect_to root_path, notice: "不適切な画像が投稿された為ブロックされました"
          end
        end
      end
      path = Rails.application.routes.recognize_path(request.referer)
      redirect_to path, notice: "スポーツジャンルを更新しました。"
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
            @sport.destroy
            return redirect_to root_path, notice: "不適切な画像が投稿された為ブロックされました"
          end
        end
      end
      path = Rails.application.routes.recognize_path(request.referer)
      redirect_to path, notice: "スポーツジャンルを作成しました。"
    else
      render "new" 
    end
  end

  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy
    redirect_to root_path, notice: "スポーツジャンルを削除しました。"
  end

  private

  def sport_params
    params.require(:sport).permit(:sport_genre, :image)
  end
end
