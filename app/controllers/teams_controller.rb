class TeamsController < ApplicationController
  def index
    @sport = Sport.find(params[:sport_id])
    @prefecture = Prefecture.find(params[:prefecture_id])
    @teams = Team.where(sport_id: @sport.id, prefecture_id: @prefecture.id).page(params[:page]).reverse_order.per(10)
    @team_comment_rooms = TeamCommentRoom.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @team_members = TeamMember.where(team_id: @team.id)
    @team_comment_room = TeamCommentRoom.find_by(team_id: @team.id)
  end

  def edit
    @team = Team.find(params[:id])
    unless @team.users.include?(current_user)
      redirect_to "/", notice: "権限がありません。"
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      # google_apiに画像の値を渡す
      unless @team.image.blank?
        visions = Vision.get_image_data(@team.image)

      # 受け取ったデータの配列を排出
        visions.each do |vision|
      # 不適切な画像である場合が高い又は非常に高い場合ブロック
          if vision.include?("VERY_LIKELY") || vision.include?("LIKELY")
            flash[:notice] = "不適切な画像の為ブロックされました。" 
            @team.image = nil
            @team.save
            return render "edit"
          end
        end
      end
      redirect_to team_path(@team), notice: "チーム情報を更新しました。"
    else
      render "edit"
    end
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      # google_apiに画像の値を渡す
      unless @team.image.blank?
        visions = Vision.get_image_data(@team.image)

      # 受け取ったデータの配列を排出
        visions.each do |vision|
      # 不適切な画像である場合が高い又は非常に高い場合ブロック
          if vision.include?("VERY_LIKELY") || vision.include?("LIKELY")
            flash[:notice] = "不適切な画像の為ブロックされました。" 
            @team.destroy
            return render "new"
          end
        end
      end
      TeamCommentRoom.create(team_id: @team.id, id: @team.id)
      TeamMember.create(user_id: current_user.id, team_id: @team.id)
      redirect_to prefecture_sport_teams_path, notice: "チームを作成しました。"
    else
      render "new"
    end
  end

  def information
    @team = Team.find(params[:id])
    @team_comment_room = TeamCommentRoom.find_by(team_id: @team.id)
    unless @team.users.include?(current_user)
      redirect_to "/", notice: "権限がありません。"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to prefecture_sport_teams_path(prefecture_id: @team.prefecture_id, sport_id: @team.sport_id), notice: "チームを削除しました。"
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
     :explanation,
     :information)
  end
end
