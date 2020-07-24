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
      path = Rails.application.routes.recognize_path(request.referer)
      redirect_to path, notice: "チーム情報を更新しました。"
    else
      render "edit"
    end
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      TeamCommentRoom.create!(team_id: @team.id, id: @team.id)
      TeamMember.create!(user_id: current_user.id, team_id: @team.id)
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
