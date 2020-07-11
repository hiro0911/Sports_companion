class TeamCommentChangeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_reference :team_comments, :team, foreign_key: true
		remove_reference :team_comments, :user, foreign_key: true
  end
end
