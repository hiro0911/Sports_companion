class ApplicantsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @applicant = Applicant.new
  end

  def create
    @team = Team.find(params[:team_id])
    if @team.users.include?(current_user)
      redirect_to team_path(@team), notice: "既にこのチームに加入済です。"
      return
    end
    @applicant = Applicant.new
    @applicant.team_id = @team.id
    @applicant.user_id = current_user.id
    if @applicant.save
      redirect_to team_applicants_thanks_path(@applicant.team), notice: "チーム加入申請しました。"
    else
      render "new"
    end
  end

  def thanks
    @team = Team.find(params[:team_id])
    @team_members = TeamMember.all
  end

  def index
    @team = Team.find(params[:team_id])
    @applicants = Applicant.where(team_id: @team.id).page(params[:page]).reverse_order.per(15)
  end

  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy
    redirect_to team_applicants_path(team_id: @applicant.team), notice: "チーム加入を拒否しました。"
  end

  def applicant_params
    params.require(:applicant).permit(:user_id, :team_id)
  end
end
