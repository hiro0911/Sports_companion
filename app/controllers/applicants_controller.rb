class ApplicantsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @applicant = Applicant.new

  end

  def create
    @applicant = Applicant.new
    @team = Team.find(params[:team_id])
    @applicant.team_id = params[:team_id]
    @applicant.user_id = current_user.id
    if @applicant.save
      redirect_to team_applicants_thanks_path(@applicant.team)
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
    redirect_to team_applicants_path(team_id: @applicant.team)
  end

  def applicant_params
    params.require(:applicant).permit(:user_id, :team_id)
  end
end
